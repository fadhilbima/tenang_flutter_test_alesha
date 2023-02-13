import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tenang_flutter_test/root/repository/model/user.dart' as userDataModel;
// import 'package:tenang_flutter_test/root/repository/model/user_relation.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final authData = FirebaseAuth.instance;
  final storage = FirebaseFirestore.instance;
  final picStore = FirebaseStorage.instance;
  String name = '';
  String email = '';
  String phonenum = '';
  String profilepicture = '';
  XFile? file;
  File? imagefile;
  ProfileBloc() : super(ProfileInitial()) {
    on<SignOutEvent>((event, emit) {
      emit(SignOutLoading());
      authData.signOut();
      emit(SignOutSuccess());
    });
    on<GetDataEvent>((event, emit) async {
      var getData = await storage
          .collection('usersData')
          .doc(authData.currentUser!.uid)
          .get();
      var value = userDataModel.AleshaUser.fromJson(getData.data() as Map<String, dynamic>);
      name = value.fullname!;
      email = value.email!;
      phonenum = value.phone!;
      profilepicture = value.profilepic!;
      print(profilepicture);
      emit(GetDataState());
    });
    on<UpdateProfilePicEvent>((event, emit) async {
      var source = ImageSource.gallery;
      XFile? pickedImage = await ImagePicker().pickImage(source: source);
      if(pickedImage != null) {
        file = pickedImage;
        CroppedFile? croppedImage = (await ImageCropper().cropImage(
          sourcePath: file!.path,
          compressQuality: 20,
          aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
        ));
        if(croppedImage != null) {
          imagefile = File(croppedImage.path);
          emit(UpdateProfilePicState());
          if(authData.currentUser!.email!.isNotEmpty) {
            UploadTask uploadTask = picStore
                .ref('profilepics')
                .child(authData.currentUser!.uid)
                .putFile(imagefile!);
            TaskSnapshot snapshot = await uploadTask;
            String? imgUrl = await snapshot.ref.getDownloadURL();
            final String image = imgUrl;
            await storage
                .collection('usersData')
                .doc(authData.currentUser!.uid)
                .update({'profilepic': image});
            emit(GetDataState());
            profilepicture = imgUrl;
          }
        }
      }
    });
  }
}

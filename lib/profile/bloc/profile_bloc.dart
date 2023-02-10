import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tenang_flutter_test/root/repository/model/user_relation.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final authData = FirebaseAuth.instance;
  final storage = FirebaseFirestore.instance;
  String name = '';
  String email = '';
  Fullname? fullname;
  ProfileBloc() : super(ProfileInitial()) {
    on<SignOutEvent>((event, emit) {
      emit(SignOutLoading());
      authData.signOut();
      emit(SignOutSuccess());
    });
    on<GetDataEvent>((event, emit) async {
      email = authData.currentUser!.email!;
      emit(GetDataState());
    });
  }
}

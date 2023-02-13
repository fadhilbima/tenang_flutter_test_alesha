import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tenang_flutter_test/root/repository/model/user.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final fullnameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool agreement = false;
  final formKey = GlobalKey<FormState>();
  final registData = FirebaseAuth.instance;
  final storage = FirebaseFirestore.instance;
  UserCredential? userRegistData;
  RegisterBloc() : super(RegisterInitial()) {
    on<RegisterSubmitEvent>((event, emit) async {
      emit(RegisterLoading());
      if(formKey.currentState!.validate() && agreement == true) {
        String fullname = fullnameController.text;
        String email = emailController.text;
        String password = passwordController.text;
        try {
          userRegistData = await registData.createUserWithEmailAndPassword(
            email: email,
            password: password,
          );
          // await registData.createUserWithEmailAndPassword(
          //   email: email,
          //   password: password,
          // );
          // Map<String, String> userFullname = {
          //   'fullname': fullname
          // };
          // await storage
          //     .collection('usersData')
          //     .doc(registData.currentUser!.uid)
          //     .set(userFullname);
          // emit(RegisterSuccess());
          // registData.signOut();
        } on FirebaseAuthException catch (error) {
          RegisterFailed('Email sudah terdaftar');
        }
        if(userRegistData != null) {
          String uid = userRegistData!.user!.uid;
          AleshaUser newUser = AleshaUser(
            uid: uid,
            email: email,
            fullname: fullname,
            profilepic: '',
            phone: '',
          );
          await storage
              .collection('usersData')
              .doc(uid)
              .set(newUser.toJson())
              .then((value) {
                emit(RegisterSuccess());
          });
        }
      } else {
        emit(RegisterFailed('Please, Fill entire form and check the agreement'));
      }
    });
  }
}

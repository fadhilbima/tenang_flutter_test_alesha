import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final auth = FirebaseAuth.instance;
  final formKey = GlobalKey<FormState>();
  LoginBloc() : super(LoginInitial()) {
    on<LoginSubmitEvent>((event, emit) async {
      emit(LoginLoading());
      if(formKey.currentState!.validate()) {
        await auth.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        ). then((value) {
          emit(LoginSuccess());
        }).onError((error, stackTrace) {
          emit(LoginFailed('Email or Password not match'));
        });
      }
    });
  }
}

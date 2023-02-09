import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final authData = FirebaseAuth.instance;
  HomeBloc() : super(HomeInitial()) {
    on<SignOutEvent>((event, emit) {
      emit(SignOutLoading());
      authData.signOut();
      emit(SignOutSuccess());
    });
  }
}

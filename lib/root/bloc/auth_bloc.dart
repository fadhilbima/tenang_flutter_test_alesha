import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tenang_flutter_test/root/repository/model/user.dart' as userData;

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final authData = FirebaseAuth.instance;
  AuthBloc() : super(AuthInitial()) {
    on<AuthRoute>((event, emit) {
      emit(AuthLoading());
      if(authData.currentUser == null) {
        emit(AuthFailed());
      } else {
        final meetRequirement = userData.AleshaUser(
          email: authData.currentUser!.email!,
          uid: authData.currentUser!.uid,
        );
        emit(AuthSuccess(meetRequirement));
      }
    });
  }
}

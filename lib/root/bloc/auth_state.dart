part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthLoading extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthSuccess extends AuthState {
  final userData.AleshaUser dataMeet;
  AuthSuccess(this.dataMeet);
  @override
  List<Object> get props => [dataMeet];
}

class AuthFailed extends AuthState {
  @override
  List<Object> get props => [];
}
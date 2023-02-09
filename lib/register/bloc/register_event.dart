part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();
}

class RegisterSubmitEvent extends RegisterEvent {
  @override
  List<Object> get props => [];
}

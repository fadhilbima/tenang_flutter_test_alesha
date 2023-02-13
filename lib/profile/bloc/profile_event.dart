part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();
}

class SignOutEvent extends ProfileEvent {
  @override
  List<Object> get props => [];
}

class GetDataEvent extends ProfileEvent {
  @override
  List<Object> get props => [];
}

class UpdateProfilePicEvent extends ProfileEvent {
  @override
  List<Object> get props => [];
}
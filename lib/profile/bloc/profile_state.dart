part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();
}

class ProfileInitial extends ProfileState {
  @override
  List<Object> get props => [];
}

class SignOutLoading extends ProfileState {
  @override
  List<Object> get props => [];
}

class SignOutSuccess extends ProfileState {
  @override
  List<Object> get props => [];
}

class GetDataState extends ProfileState {
  @override
  List<Object> get props => [];
}

class UpdateProfilePicState extends ProfileState {
  @override
  List<Object> get props => [];
}

class ProfilePicUpdated extends ProfileState {
  @override
  List<Object> get props => [];
}
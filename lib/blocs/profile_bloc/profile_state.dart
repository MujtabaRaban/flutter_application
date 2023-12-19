import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class ProfilePageState extends Equatable {
  const ProfilePageState();

  @override
  List<Object?> get props => [];
}

class SignOutInProgressState extends ProfilePageState {}

class SignOutSuccessState extends ProfilePageState {}

class LoadedProfileState extends ProfilePageState {}

class LoadingProfileState extends ProfilePageState {}

class SignOutErrorState extends ProfilePageState {
  final String errorMessage;

  const SignOutErrorState(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

class ErrorProfileState extends ProfilePageState {
  final String errorMessage;

  ErrorProfileState(this.errorMessage);
}

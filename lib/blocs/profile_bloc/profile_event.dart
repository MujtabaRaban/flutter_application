import 'package:equatable/equatable.dart';

abstract class ProfilePageEvent extends Equatable {
  const ProfilePageEvent();

  @override
  List<Object?> get props => [];
}

class LoadProfileDataEvent extends ProfilePageEvent {}

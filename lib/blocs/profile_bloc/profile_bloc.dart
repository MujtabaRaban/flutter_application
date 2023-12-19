import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'profile_event.dart';
import 'profile_state.dart';

import 'package:user_repository/user_repository.dart';

class ProfilePageBloc extends Bloc<ProfilePageEvent, ProfilePageState> {
  final UserRepository? _userRepository;

  ProfilePageBloc({
    userRepository,
  })  : _userRepository = userRepository,
        super(SignOutSuccessState()) {
    on<LoadProfileDataEvent>(
        (event, emit) => _handleLoadprofileDataEvent(event, emit));
  }

  void _handleLoadprofileDataEvent(
    LoadProfileDataEvent event,
    Emitter<ProfilePageState> emit,
  ) async {
    emit(LoadingProfileState());

    try {
      // Simulating data loading using a delayed Future
      await Future.delayed(Duration(seconds: 2));

      // Replace the following with your actual data loading logic
      // For example, fetch data from an API or database
      // If data is loaded successfully, emit LoadedHomeState
      // If there's an error, emit ErrorHomeState with an error message

      // Replace the mock data with your actual data

      emit(LoadedProfileState());
    } catch (e) {
      emit(ErrorProfileState('Error loading data: $e'));
    }
  }
}

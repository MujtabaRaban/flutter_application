import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../database/event.dart';
import '../../database/tournament_event.dart';
import 'home_screen_event.dart';
import 'home_screen_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(InitialHomeState()) {
    on<LoadHomeDataEvent>(
        (event, emit) => _handleLoadHomeDataEvent(event, emit));
  }

  void _handleLoadHomeDataEvent(
    LoadHomeDataEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(LoadingHomeState());

    try {
      // Simulating data loading using a delayed Future
      await Future.delayed(Duration(seconds: 2));

      // Replace the following with your actual data loading logic
      // For example, fetch data from an API or database
      // If data is loaded successfully, emit LoadedHomeState
      // If there's an error, emit ErrorHomeState with an error message

      // Replace the mock data with your actual data
      final List<Event> events = [
        Event("assets/images/img_cardbanner.png", "Winter Cup #2", "12:00 PM",
            "Dedicated", Colors.red, 16.0),
        Event(
            "assets/images/img_cardbanner_200x101.png",
            "Le goultarminator #11 - 2023",
            "03:30 PM",
            "Limited Seats",
            Colors.green,
            20.0),
        Event(
            "assets/images/img_cardbanner_200x279.png",
            "1000 & 1 Claws Tournament",
            "06:45 PM",
            "Register Now",
            Colors.blue,
            12.0),
        // Add more events as needed
      ];

      final List<Tournamentsevent> tournamentsevents = [
        Tournamentsevent("assets/images/img_img_1.png", "Winter Cup #2",
            "12:00 PM", "5v5", "1000 SAR"),
        Tournamentsevent("assets/images/img_img_2.png", "Le goultarminator #11",
            "03:30 PM", "3v3", "500 SAR"),
        Tournamentsevent("assets/images/img_img_3.png",
            "1000 & 1 Claws Tournament", "06:45 PM", "1v1", "200 SAR"),
        // Add more events as needed
      ];

      emit(LoadedHomeState(
        loadedEvents: events,
        loadedTournamentsevents: tournamentsevents,
      ));
    } catch (e) {
      emit(ErrorHomeState('Error loading data: $e'));
    }
  }
}

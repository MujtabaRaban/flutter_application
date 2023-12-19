import 'package:firebase_auth_youtube/database/event.dart';
import 'package:firebase_auth_youtube/database/tournament_event.dart';

abstract class HomeState {}

class InitialHomeState extends HomeState {}

class LoadingHomeState extends HomeState {}

class LoadedHomeState extends HomeState {
  final List<Event> loadedEvents;
  final List<Tournamentsevent> loadedTournamentsevents;

  LoadedHomeState({
    required this.loadedEvents,
    required this.loadedTournamentsevents,
  });

  @override
  List<Object> get props => [loadedEvents, loadedTournamentsevents];
}



class ErrorHomeState extends HomeState {
  final String errorMessage;

  ErrorHomeState(this.errorMessage);
}
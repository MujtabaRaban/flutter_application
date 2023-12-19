import '../../database/tournament_event.dart';

abstract class TournamentPageState {}

class LoadingTournamentDataState extends TournamentPageState {}

class LoadedTournamentDataState extends TournamentPageState {
  final List<Tournamentsevent> tournamentsevents;
  LoadedTournamentDataState({
    required this.tournamentsevents,
  });
}

class ErrorTournamentDataState extends TournamentPageState {
  final String errorMessage;

  ErrorTournamentDataState(this.errorMessage);
}

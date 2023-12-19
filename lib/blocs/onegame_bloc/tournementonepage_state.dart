part of 'tournementonepage_bloc.dart';

abstract class TournementonepageState {}

class LoadingTournamentOneDataState extends TournementonepageState {}

class LoadedTournamentOneDataState extends TournementonepageState {
  final List<Tournamentsevent> tournamentsevents;
  LoadedTournamentOneDataState({
    required this.tournamentsevents,
  });
}

class ErrorTournamentOneDataState extends TournementonepageState {
  final String errorMessage;

  ErrorTournamentOneDataState(this.errorMessage);
}

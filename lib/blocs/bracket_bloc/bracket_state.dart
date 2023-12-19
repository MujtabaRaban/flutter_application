import '../../database/bracket.dart';

class BracketPageState {
  // Add any state properties as needed
}

class LoadingBracketDataState extends BracketPageState {}

class LoadedBracketDataState extends BracketPageState {
  final List<MatchResult> matchResults;
  final List<TeamStats> teamStats;

  LoadedBracketDataState({
    required this.matchResults,
    required this.teamStats,
  });
}

class ErrorBracketDataState extends BracketPageState {
  final String errorMessage;

  ErrorBracketDataState(this.errorMessage);
}

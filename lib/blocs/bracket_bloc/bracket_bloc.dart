import 'package:bloc/bloc.dart';
import '../../database/bracket.dart';
import 'bracket_event.dart';
import 'bracket_state.dart';

class BracketPageBloc extends Bloc<BracketPageEvent, BracketPageState> {
  BracketPageBloc() : super(LoadingBracketDataState()) {
    on<LoadBracketDataEvent>(
        (event, emit) => _handleLoadBracketDataEvent(event, emit));
  }

  void _handleLoadBracketDataEvent(
    LoadBracketDataEvent event,
    Emitter<BracketPageState> emit,
  ) async {
    emit(LoadingBracketDataState());

    try {
      // Simulating data loading using a delayed Future
      await Future.delayed(Duration(seconds: 2));

      // Replace the following with your actual data loading logic
      // If data is loaded successfully, emit LoadedBracketDataState
      // If there's an error, emit ErrorBracketDataState with an error message

      // Replace the mock data with your actual data
      final List<MatchResult> matchResults = [
        MatchResult(team1: 'Team1', team2: 'Team2', score1: 2, score2: 1),
        MatchResult(
            team1: 'Team4', team2: 'Team6', score1: 1, score2: 3, isLive: true),
        MatchResult(team1: 'Team3', team2: 'Team5', score1: 3, score2: 0),
        MatchResult(team1: 'Team2', team2: 'Team7', score1: 2, score2: 2),
        // Add more match results as needed
      ];

      final List<TeamStats> teamStats = [
        TeamStats(teamName: 'Team1', points: 3, ranking: 1, matchesPlayed: 1),
        TeamStats(teamName: 'Team6', points: 3, ranking: 2, matchesPlayed: 1),
        TeamStats(teamName: 'Team3', points: 3, ranking: 3, matchesPlayed: 1),
        TeamStats(teamName: 'Team5', points: 0, ranking: 4, matchesPlayed: 1),
        TeamStats(teamName: 'Team2', points: 1, ranking: 5, matchesPlayed: 1),
        TeamStats(teamName: 'Team7', points: 1, ranking: 6, matchesPlayed: 1),
        // Add more teams as needed
      ];

      emit(LoadedBracketDataState(
        matchResults: matchResults,
        teamStats: teamStats,
      ));
    } catch (e) {
      emit(ErrorBracketDataState('Error loading data: $e'));
    }
  }
}

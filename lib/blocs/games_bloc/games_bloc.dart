import 'package:bloc/bloc.dart';

import '../../database/games.dart';
import 'games_event.dart';
import 'games_state.dart';

class GamePageBloc extends Bloc<GamePageEvent, GamePageState> {
  GamePageBloc() : super(LoadingGameDataState()) {
    on<LoadGameDataEvent>(
        (event, emit) => _handleLoadTournamentDataEvent(event, emit));
  }

  void _handleLoadTournamentDataEvent(
    LoadGameDataEvent event,
    Emitter<GamePageState> emit,
  ) async {
    emit(LoadingGameDataState());

    try {
      // Simulating data loading using a delayed Future
      await Future.delayed(Duration(seconds: 2));

      // Replace the following with your actual data loading logic
      // For example, fetch data from an API or database
      // If data is loaded successfully, emit LoadedHomeState
      // If there's an error, emit ErrorHomeState with an error message

      // Replace the mock data with your actual data

      final List<Games> games = [
        Games(
          "assets/images/img_img_1.png",
          "Dofus Arena",
          "MMORPG",
          "Solo play",
        ),
        Games("assets/images/img_img_2.png", "One More Gate", "MOBA", "MMO"),
        Games("assets/images/img_img_3.png", "Krosmaga", "card games",
            "Adventure"),
        // Add more games as needed
      ];

      emit(LoadedGameDataState(
        games: games,
      ));
    } catch (e) {
      emit(ErrorGameDataState('Error loading data: $e'));
    }
  }
}

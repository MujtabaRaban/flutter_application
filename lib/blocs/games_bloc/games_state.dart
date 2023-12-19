import '../../database/games.dart';

abstract class GamePageState {}

class LoadingGameDataState extends GamePageState {}

class LoadedGameDataState extends GamePageState {
  final List<Games> games;

  LoadedGameDataState({
    required this.games,
  });
}

class ErrorGameDataState extends GamePageState {
  final String errorMessage;

  ErrorGameDataState(this.errorMessage);
}

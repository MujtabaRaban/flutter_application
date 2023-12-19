import 'package:equatable/equatable.dart';

abstract class GamePageEvent extends Equatable {
  const GamePageEvent();

  @override
  List<Object?> get props => [];
}

class LoadGameDataEvent extends GamePageEvent {}

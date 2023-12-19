import 'package:equatable/equatable.dart';

abstract class TournamentPageEvent extends Equatable {
  const TournamentPageEvent();

  @override
  List<Object?> get props => [];
}

class LoadTournamentDataEvent extends TournamentPageEvent {}

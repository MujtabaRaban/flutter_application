part of 'tournementonepage_bloc.dart';

abstract class TournementonepageEvent extends Equatable {
  const TournementonepageEvent();

  @override
  List<Object?> get props => [];
}

class LoadTournementonepageDataEvent extends TournementonepageEvent {}

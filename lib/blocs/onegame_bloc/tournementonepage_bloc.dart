import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../database/tournament_event.dart';

part 'tournementonepage_event.dart';
part 'tournementonepage_state.dart';

class TournementonepageBloc
    extends Bloc<TournementonepageEvent, TournementonepageState> {
  TournementonepageBloc() : super(LoadingTournamentOneDataState()) {
    on<LoadTournementonepageDataEvent>(
        (event, emit) => _handleLoadTournamentoneDataEvent(event, emit));
  }

  void _handleLoadTournamentoneDataEvent(
    LoadTournementonepageDataEvent event,
    Emitter<TournementonepageState> emit,
  ) async {
    emit(LoadingTournamentOneDataState());

    try {
      // Simulating data loading using a delayed Future
      await Future.delayed(Duration(seconds: 2));

      // Replace the following with your actual data loading logic
      // For example, fetch data from an API or database
      // If data is loaded successfully, emit LoadedHomeState
      // If there's an error, emit ErrorHomeState with an error message

      // Replace the mock data with your actual data
      final List<Tournamentsevent> tournamentsevents = [
        Tournamentsevent("assets/images/img_img_1.png", "Winter Cup #2",
            "12:00 PM", "5v5", "1000 SAR"),
        Tournamentsevent("assets/images/img_img_1.png", "Le goultarminator #11",
            "03:30 PM", "3v3", "500 SAR"),
        Tournamentsevent("assets/images/img_img_1.png",
            "1000 & 1 Claws Tournament", "06:45 PM", "1v1", "200 SAR"),
        // Add more events as needed
      ];

      emit(LoadedTournamentOneDataState(
        tournamentsevents: tournamentsevents,
      ));
    } catch (e) {
      emit(ErrorTournamentOneDataState('Error loading data: $e'));
    }
  }
}

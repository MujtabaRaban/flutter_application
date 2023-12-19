import 'package:bloc/bloc.dart';

import '../../database/tournament_event.dart';
import 'tournement_event.dart';
import 'tournement_state.dart';

class TournamentPageBloc
    extends Bloc<TournamentPageEvent, TournamentPageState> {
  TournamentPageBloc() : super(LoadingTournamentDataState()) {
    on<LoadTournamentDataEvent>(
        (event, emit) => _handleLoadTournamentDataEvent(event, emit));
  }

  void _handleLoadTournamentDataEvent(
    LoadTournamentDataEvent event,
    Emitter<TournamentPageState> emit,
  ) async {
    emit(LoadingTournamentDataState());

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
        Tournamentsevent("assets/images/img_img_2.png", "Le goultarminator #11",
            "03:30 PM", "3v3", "500 SAR"),
        Tournamentsevent("assets/images/img_img_3.png",
            "1000 & 1 Claws Tournament", "06:45 PM", "1v1", "200 SAR"),
        // Add more events as needed
      ];

      emit(LoadedTournamentDataState(
        tournamentsevents: tournamentsevents,
      ));
    } catch (e) {
      emit(ErrorTournamentDataState('Error loading data: $e'));
    }
  }
}

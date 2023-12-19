import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/bracket_bloc/bracket_bloc.dart';
import '../../blocs/bracket_bloc/bracket_event.dart';
import '../../blocs/bracket_bloc/bracket_state.dart';
import '../../database/bracket.dart';
import '../../theme/theme_helper.dart';
import '../../widgets/app_bar_2.dart';

class BracketPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<BracketPageBloc>(
      create: (context) => BracketPageBloc()..add(LoadBracketDataEvent()),
      child: _BracketPageContent(),
    );
  }
}

class _BracketPageContent extends StatefulWidget {
  @override
  _BracketPageContentState createState() => _BracketPageContentState();
}

class _BracketPageContentState extends State<_BracketPageContent> {
  late final BracketPageBloc _bracketPageBloc;

  @override
  void initState() {
    super.initState();
    _bracketPageBloc = BlocProvider.of<BracketPageBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBar2(name: "Tournament Bracket"),
      backgroundColor: appTheme.blueGray900,
      body: BlocBuilder<BracketPageBloc, BracketPageState>(
        builder: (context, state) {
          if (state is LoadedBracketDataState) {
            return Container(
              constraints: const BoxConstraints.expand(),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Expanded(
                      child: buildMatchCards(state.matchResults),
                    ),
                    const SizedBox(height: 20),
                    buildStatsTable(state.teamStats),
                  ],
                ),
              ),
            );
          } else if (state is LoadingBracketDataState) {
            return _buildLoadingState();
          } else if (state is ErrorBracketDataState) {
            return _buildErrorState(state.errorMessage);
          } else {
            return _buildLoadingState(); // Adjust this based on your requirements
          }
        },
      ),
    );
  }

  Widget _buildLoadingState() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildErrorState(String errorMessage) {
    return Center(
      child: Text(
        errorMessage,
        style: TextStyle(color: Colors.red),
      ),
    );
  }

  Widget buildMatchCards(List<MatchResult> matchResults) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: matchResults.length,
      itemBuilder: (context, index) => buildMatchCard(matchResults[index]),
    );
  }

  Widget buildMatchCard(MatchResult matchResult) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(child: buildTeamWidget(matchResult.team1)),
            buildWinnerWidget(matchResult),
            Expanded(child: buildTeamWidget(matchResult.team2)),
          ],
        ),
      ),
    );
  }

  Widget buildTeamWidget(String teamName) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Image.asset(
            'assets/images/teams/${teamName.toLowerCase()}_image.png',
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            teamName,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget buildWinnerWidget(MatchResult matchResult) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: matchResult.isLive ? Colors.yellow : Colors.green,
        borderRadius: BorderRadius.circular(3),
      ),
      child: Text(
        matchResult.isLive
            ? 'Live'
            : '${matchResult.score1} : ${matchResult.score2}',
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  Widget buildStatsTable(List<TeamStats> teamStats) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: [
          const DataColumn(label: Text('Team')),
          const DataColumn(label: Text('Points')),
          const DataColumn(label: Text('Ranking')),
          const DataColumn(label: Text('Matches Played')),
        ],
        rows: teamStats.map((team) => buildStatsRow(team)).toList(),
      ),
    );
  }

  DataRow buildStatsRow(TeamStats team) {
    return DataRow(
      cells: [
        DataCell(Text(team.teamName)),
        DataCell(Text(team.points.toString())),
        DataCell(Text(team.ranking.toString())),
        DataCell(Text(team.matchesPlayed.toString())),
      ],
    );
  }

  @override
  void dispose() {
    _bracketPageBloc.close();
    super.dispose();
  }
}

class MatchResult {
  final String team1;
  final String team2;
  final int score1;
  final int score2;
  final bool isLive;

  MatchResult({
    required this.team1,
    required this.team2,
    required this.score1,
    required this.score2,
    this.isLive = false,
  });
}

class TeamStats {
  final String teamName;
  final int points;
  final int ranking;
  final int matchesPlayed;

  TeamStats({
    required this.teamName,
    required this.points,
    required this.ranking,
    required this.matchesPlayed,
  });
}
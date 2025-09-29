class GameStatsModel {
  final bool success;
  final String message;
  final GameStatisticsData data;

  GameStatsModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory GameStatsModel.fromJson(Map<String, dynamic> json) {
    return GameStatsModel(
      success: json['success'],
      message: json['message'],
      data: GameStatisticsData.fromJson(json['data']),
    );
  }
}

class GameStatisticsData {
  final String id;
  final String mode;
  final String status;
  final GameCount count;
  final List<GamePlayer> gamePlayers;
  final AggregatedStats aggregated;

  GameStatisticsData({
    required this.id,
    required this.mode,
    required this.status,
    required this.count,
    required this.gamePlayers,
    required this.aggregated,
  });

  factory GameStatisticsData.fromJson(Map<String, dynamic> json) {
    return GameStatisticsData(
      id: json['id'],
      mode: json['mode'],
      status: json['status'],
      count: GameCount.fromJson(json['_count']),
      gamePlayers: (json['game_players'] as List)
          .map((e) => GamePlayer.fromJson(e))
          .toList(),
      aggregated: AggregatedStats.fromJson(json['aggregated']),
    );
  }
}

class GameCount {
  final int gamePlayers;
  final int rooms;
  final int leaderboards;

  GameCount({
    required this.gamePlayers,
    required this.rooms,
    required this.leaderboards,
  });

  factory GameCount.fromJson(Map<String, dynamic> json) {
    return GameCount(
      gamePlayers: json['game_players'],
      rooms: json['rooms'],
      leaderboards: json['leaderboards'],
    );
  }
}

class GamePlayer {
  final int score;
  final int correctAnswers;
  final int wrongAnswers;
  final int skippedAnswers;

  GamePlayer({
    required this.score,
    required this.correctAnswers,
    required this.wrongAnswers,
    required this.skippedAnswers,
  });

  factory GamePlayer.fromJson(Map<String, dynamic> json) {
    return GamePlayer(
      score: json['score'],
      correctAnswers: json['correct_answers'],
      wrongAnswers: json['wrong_answers'],
      skippedAnswers: json['skipped_answers'],
    );
  }
}

class AggregatedStats {
  final int totalQuestions;
  final int totalCorrect;
  final int totalWrong;
  final int totalSkipped;
  final int totalScore;
  final int accuracyRate;
  final double averageScore;

  AggregatedStats({
    required this.totalQuestions,
    required this.totalCorrect,
    required this.totalWrong,
    required this.totalSkipped,
    required this.totalScore,
    required this.accuracyRate,
    required this.averageScore,
  });

  factory AggregatedStats.fromJson(Map<String, dynamic> json) {
    return AggregatedStats(
      totalQuestions: json['total_questions'],
      totalCorrect: json['total_correct'],
      totalWrong: json['total_wrong'],
      totalSkipped: json['total_skipped'],
      totalScore: json['total_score'],
      accuracyRate: json['accuracy_rate'],
      averageScore: (json['average_score'] as num).toDouble(),
    );
  }
}

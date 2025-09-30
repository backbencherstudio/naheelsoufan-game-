class GameResultModel {
  final bool success;
  final String message;
  final GameData data;

  GameResultModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory GameResultModel.fromJson(Map<String, dynamic> json) {
    return GameResultModel(
      success: json['success'],
      message: json['message'],
      data: GameData.fromJson(json['data']),
    );
  }
}

class GameData {
  final GameInfo gameInfo;
  final List<PlayerRanking> finalRankings;
  final List<LeaderboardEntry> leaderboard;
  final GameStatistics gameStatistics;
  final Podium podium;

  GameData({
    required this.gameInfo,
    required this.finalRankings,
    required this.leaderboard,
    required this.gameStatistics,
    required this.podium,
  });

  factory GameData.fromJson(Map<String, dynamic> json) {
    return GameData(
      gameInfo: GameInfo.fromJson(json['game_info']),
      finalRankings: (json['final_rankings'] as List)
          .map((e) => PlayerRanking.fromJson(e))
          .toList(),
      leaderboard: (json['leaderboard'] as List)
          .map((e) => LeaderboardEntry.fromJson(e))
          .toList(),
      gameStatistics: GameStatistics.fromJson(json['game_statistics']),
      podium: Podium.fromJson(json['podium']),
    );
  }
}

class GameInfo {
  final String id;
  final String mode;
  final String status;
  final Language language;
  final int totalPlayers;
  final int maxPlayers;

  GameInfo({
    required this.id,
    required this.mode,
    required this.status,
    required this.language,
    required this.totalPlayers,
    required this.maxPlayers,
  });

  factory GameInfo.fromJson(Map<String, dynamic> json) {
    return GameInfo(
      id: json['id'],
      mode: json['mode'],
      status: json['status'],
      language: Language.fromJson(json['language']),
      totalPlayers: json['total_players'],
      maxPlayers: json['max_players'],
    );
  }
}

class Language {
  final String id;
  final String name;
  final String code;

  Language({
    required this.id,
    required this.name,
    required this.code,
  });

  factory Language.fromJson(Map<String, dynamic> json) {
    return Language(
      id: json['id'],
      name: json['name'],
      code: json['code'],
    );
  }
}

class PlayerRanking {
  final int position;
  final String playerId;
  final User user;
  final int score;
  final int correctAnswers;
  final int wrongAnswers;
  final int skippedAnswers;
  final int totalQuestions;
  final String accuracy;
  final int playerOrder;
  final String createdAt;

  PlayerRanking({
    required this.position,
    required this.playerId,
    required this.user,
    required this.score,
    required this.correctAnswers,
    required this.wrongAnswers,
    required this.skippedAnswers,
    required this.totalQuestions,
    required this.accuracy,
    required this.playerOrder,
    required this.createdAt,
  });

  factory PlayerRanking.fromJson(Map<String, dynamic> json) {
    return PlayerRanking(
      position: json['position'],
      playerId: json['player_id'],
      user: User.fromJson(json['user']),
      score: json['score'],
      correctAnswers: json['correct_answers'],
      wrongAnswers: json['wrong_answers'],
      skippedAnswers: json['skipped_answers'],
      totalQuestions: json['total_questions'],
      accuracy: json['accuracy'],
      playerOrder: json['player_order'],
      createdAt: json['created_at'],
    );
  }
}

class LeaderboardEntry {
  final int leaderboardPosition;
  final User user;
  final int score;
  final int correct;
  final int wrong;
  final int skipped;
  final int gamesPlayed;
  final String mode;
  final String createdAt;

  LeaderboardEntry({
    required this.leaderboardPosition,
    required this.user,
    required this.score,
    required this.correct,
    required this.wrong,
    required this.skipped,
    required this.gamesPlayed,
    required this.mode,
    required this.createdAt,
  });

  factory LeaderboardEntry.fromJson(Map<String, dynamic> json) {
    return LeaderboardEntry(
      leaderboardPosition: json['leaderboard_position'],
      user: User.fromJson(json['user']),
      score: json['score'],
      correct: json['correct'],
      wrong: json['wrong'],
      skipped: json['skipped'],
      gamesPlayed: json['games_played'],
      mode: json['mode'],
      createdAt: json['created_at'],
    );
  }
}

class GameStatistics {
  final Winner winner;
  final TopPerformer topPerformer;
  final int averageScore;
  final int totalQuestionsPerPlayer;
  final String completionRate;

  GameStatistics({
    required this.winner,
    required this.topPerformer,
    required this.averageScore,
    required this.totalQuestionsPerPlayer,
    required this.completionRate,
  });

  factory GameStatistics.fromJson(Map<String, dynamic> json) {
    return GameStatistics(
      winner: Winner.fromJson(json['winner']),
      topPerformer: TopPerformer.fromJson(json['top_performer']),
      averageScore: json['average_score'],
      totalQuestionsPerPlayer: json['total_questions_per_player'],
      completionRate: json['completion_rate'],
    );
  }
}

class Winner {
  final User user;
  final int score;
  final String accuracy;

  Winner({
    required this.user,
    required this.score,
    required this.accuracy,
  });

  factory Winner.fromJson(Map<String, dynamic> json) {
    return Winner(
      user: User.fromJson(json['user']),
      score: json['score'],
      accuracy: json['accuracy'],
    );
  }
}

class TopPerformer {
  final User user;
  final int score;
  final int correctAnswers;

  TopPerformer({
    required this.user,
    required this.score,
    required this.correctAnswers,
  });

  factory TopPerformer.fromJson(Map<String, dynamic> json) {
    return TopPerformer(
      user: User.fromJson(json['user']),
      score: json['score'],
      correctAnswers: json['correct_answers'],
    );
  }
}

class Podium {
  final PodiumPlayer? firstPlace;
  final PodiumPlayer? secondPlace;
  final PodiumPlayer? thirdPlace;

  Podium({
    required this.firstPlace,
    required this.secondPlace,
    required this.thirdPlace,
  });

  factory Podium.fromJson(Map<String, dynamic> json) {
    return Podium(
      firstPlace: json['first_place'] != null
          ? PodiumPlayer.fromJson(json['first_place'])
          : null,
      secondPlace: json['second_place'] != null
          ? PodiumPlayer.fromJson(json['second_place'])
          : null,
      thirdPlace: json['third_place'] != null
          ? PodiumPlayer.fromJson(json['third_place'])
          : null,
    );
  }
}

class PodiumPlayer {
  final String id;
  final String createdAt;
  final String updatedAt;
  final String playerName;
  final String gameId;
  final String roomId;
  final String status;
  final int score;
  final int correctAnswers;
  final int wrongAnswers;
  final int skippedAnswers;
  final int playerOrder;
  final int finalRank;
  final String userId;
  final bool isGuest;
  final User user;

  PodiumPlayer({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.playerName,
    required this.gameId,
    required this.roomId,
    required this.status,
    required this.score,
    required this.correctAnswers,
    required this.wrongAnswers,
    required this.skippedAnswers,
    required this.playerOrder,
    required this.finalRank,
    required this.userId,
    required this.isGuest,
    required this.user,
  });

  factory PodiumPlayer.fromJson(Map<String, dynamic> json) {
    return PodiumPlayer(
      id: json['id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      playerName: json['player_name'],
      gameId: json['game_id'],
      roomId: json['room_id'],
      status: json['status'],
      score: json['score'],
      correctAnswers: json['correct_answers'],
      wrongAnswers: json['wrong_answers'],
      skippedAnswers: json['skipped_answers'],
      playerOrder: json['player_order'],
      finalRank: json['final_rank'],
      userId: json['user_id'],
      isGuest: json['is_guest'],
      user: User.fromJson(json['user']),
    );
  }
}

class User {
  final String id;
  final String name;
  final String email;
  final String? avatar;

  User({
    required this.id,
    required this.name,
    required this.email,
    this.avatar,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      avatar: json['avatar'],
    );
  }
}

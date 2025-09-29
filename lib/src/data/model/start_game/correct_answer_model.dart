class CorrectAnswerModel {
  final bool success;
  final String message;
  final AnswerResultData data;

  CorrectAnswerModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory CorrectAnswerModel.fromJson(Map<String, dynamic> json) {
    return CorrectAnswerModel(
      success: json['success'],
      message: json['message'],
      data: AnswerResultData.fromJson(json['data']),
    );
  }
}

class AnswerResultData {
  final bool isCorrect;
  final bool isSteal;
  final int pointsEarned;
  final int playerScore;
  final String nextAction;
  final String playerId;
  final String playerName;
  final NextTurnFor nextTurnFor;
  final Map<String, List<PlayerHistory>> allPlayersHistory;

  AnswerResultData({
    required this.isCorrect,
    required this.isSteal,
    required this.pointsEarned,
    required this.playerScore,
    required this.nextAction,
    required this.playerId,
    required this.playerName,
    required this.nextTurnFor,
    required this.allPlayersHistory,
  });

  factory AnswerResultData.fromJson(Map<String, dynamic> json) {
    return AnswerResultData(
      isCorrect: json['is_correct'],
      isSteal: json['is_steal'],
      pointsEarned: json['points_earned'],
      playerScore: json['player_score'],
      nextAction: json['next_action'],
      playerId: json['player_id'],
      playerName: json['player_name'],
      nextTurnFor: NextTurnFor.fromJson(json['next_turn_for']),
      allPlayersHistory: (json['all_players_history'] as Map<String, dynamic>).map(
            (key, value) => MapEntry(
          key,
          (value as List).map((e) => PlayerHistory.fromJson(e)).toList(),
        ),
      ),
    );
  }
}

class NextTurnFor {
  final String playerId;
  final String playerName;
  final int playerOrder;

  NextTurnFor({
    required this.playerId,
    required this.playerName,
    required this.playerOrder,
  });

  factory NextTurnFor.fromJson(Map<String, dynamic> json) {
    return NextTurnFor(
      playerId: json['player_id'],
      playerName: json['player_name'],
      playerOrder: json['player_order'],
    );
  }
}

class PlayerHistory {
  final String category;
  final String difficulty;

  PlayerHistory({
    required this.category,
    required this.difficulty,
  });

  factory PlayerHistory.fromJson(Map<String, dynamic> json) {
    return PlayerHistory(
      category: json['category'],
      difficulty: json['difficulty'],
    );
  }
}

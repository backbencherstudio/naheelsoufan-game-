class PlayerModel {
  final bool success;
  final String message;
  final Data data;

  PlayerModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory PlayerModel.fromJson(Map<String, dynamic> json) {
    return PlayerModel(
      success: json['success'],
      message: json['message'],
      data: Data.fromJson(json['data']),
    );
  }
}

class Data {
  final List<Player> players;
  final int totalPlayers;
  final int remainingSlots;

  Data({
    required this.players,
    required this.totalPlayers,
    required this.remainingSlots,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      players: List<Player>.from(json['players'].map((x) => Player.fromJson(x))),
      totalPlayers: json['total_players'],
      remainingSlots: json['remaining_slots'],
    );
  }
}

class Player {
  final String id;
  final String createdAt;
  final String updatedAt;
  final String playerName;
  final String gameId;
  final String? roomId;
  final String status;
  final int score;
  final int correctAnswers;
  final int wrongAnswers;
  final int skippedAnswers;
  final int playerOrder;
  final String? finalRank;
  final String userId;
  final bool isGuest;

  Player({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.playerName,
    required this.gameId,
    this.roomId,
    required this.status,
    required this.score,
    required this.correctAnswers,
    required this.wrongAnswers,
    required this.skippedAnswers,
    required this.playerOrder,
    this.finalRank,
    required this.userId,
    required this.isGuest,
  });

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
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
    );
  }
}

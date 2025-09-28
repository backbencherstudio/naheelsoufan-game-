class PlayerModel {
  final String? playerId;
  final String? playerName;
  final String? gameId;
  final String? roomId;
  final String? status;
  final int? score;
  final int? correctAnswers;
  final int? wrongAnswers;
  final int? skippedAnswers;
  final int? playerOrder;
  final int? finalRank;
  final String? userId;
  final bool? isGuest;

  PlayerModel({
    this.playerId,
    this.playerName,
    this.gameId,
    this.roomId,
    this.status,
    this.score,
    this.correctAnswers,
    this.wrongAnswers,
    this.skippedAnswers,
    this.playerOrder,
    this.finalRank,
    this.userId,
    this.isGuest,
  });

  factory PlayerModel.fromJson(Map<String, dynamic> json) {
    return PlayerModel(
      playerId: json['id'],
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
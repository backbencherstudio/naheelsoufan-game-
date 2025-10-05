class GameResult {
  final bool success;
  final String message;
  final GameData data;

  GameResult({
    required this.success,
    required this.message,
    required this.data,
  });

  factory GameResult.fromJson(Map<String, dynamic> json) => GameResult(
    success: json['success'],
    message: json['message'],
    data: GameData.fromJson(json['data']),
  );
}

class GameData {
  final GameInfo gameInfo;
  final List<FinalRanking> finalRankings;
  final Podium podium;

  GameData({
    required this.gameInfo,
    required this.finalRankings,
    required this.podium,
  });

  factory GameData.fromJson(Map<String, dynamic> json) => GameData(
    gameInfo: GameInfo.fromJson(json['game_info']),
    finalRankings: (json['final_rankings'] as List)
        .map((e) => FinalRanking.fromJson(e))
        .toList(),
    podium: Podium.fromJson(json['podium']),
  );
}

class GameInfo {
  final String id;
  final String mode;
  final String status;
  final Language language;
  final int totalPlayers;
  final int maxPlayers;
  final User hostUser;

  GameInfo({
    required this.id,
    required this.mode,
    required this.status,
    required this.language,
    required this.totalPlayers,
    required this.maxPlayers,
    required this.hostUser,
  });

  factory GameInfo.fromJson(Map<String, dynamic> json) => GameInfo(
    id: json['id'],
    mode: json['mode'],
    status: json['status'],
    language: Language.fromJson(json['language']),
    totalPlayers: json['total_players'],
    maxPlayers: json['max_players'],
    hostUser: User.fromJson(json['host_user']),
  );
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

  factory Language.fromJson(Map<String, dynamic> json) => Language(
    id: json['id'],
    name: json['name'],
    code: json['code'],
  );
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

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json['id'],
    name: json['name'],
    email: json['email'],
    avatar: json['avatar'],
  );
}

class FinalRanking {
  final int position;
  final String playerId;
  final String playerName;
  final int score;
  final int correctAnswers;
  final int wrongAnswers;
  final int skippedAnswers;
  final int totalQuestions;
  final String accuracy;
  final int playerOrder;
  final String createdAt;

  FinalRanking({
    required this.position,
    required this.playerId,
    required this.playerName,
    required this.score,
    required this.correctAnswers,
    required this.wrongAnswers,
    required this.skippedAnswers,
    required this.totalQuestions,
    required this.accuracy,
    required this.playerOrder,
    required this.createdAt,
  });

  factory FinalRanking.fromJson(Map<String, dynamic> json) => FinalRanking(
    position: json['position'],
    playerId: json['player_id'],
    playerName: json['player_name'],
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

class Podium {
  final PodiumPlayer firstPlace;
  final PodiumPlayer secondPlace;
  final PodiumPlayer thirdPlace;

  Podium({
    required this.firstPlace,
    required this.secondPlace,
    required this.thirdPlace,
  });

  factory Podium.fromJson(Map<String, dynamic> json) => Podium(
    firstPlace: PodiumPlayer.fromJson(json['first_place']),
    secondPlace: PodiumPlayer.fromJson(json['second_place']),
    thirdPlace: PodiumPlayer.fromJson(json['third_place']),
  );
}

class PodiumPlayer {
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
    this.roomId,
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

  factory PodiumPlayer.fromJson(Map<String, dynamic> json) => PodiumPlayer(
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

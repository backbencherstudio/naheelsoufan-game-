class LastGameModel {
  bool success;
  String message;
  List<GameData> data;

  LastGameModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory LastGameModel.fromJson(Map<String, dynamic> json) => LastGameModel(
    success: json["success"],
    message: json["message"],
    data: List<GameData>.from(json["data"].map((x) => GameData.fromJson(x))),
  );
}

class GameData {
  GameInfo gameInfo;
  dynamic yourPlayerInfo; // nullable, can be any type or null
  List<dynamic> allPlayers;

  GameData({
    required this.gameInfo,
    this.yourPlayerInfo,
    required this.allPlayers,
  });

  factory GameData.fromJson(Map<String, dynamic> json) => GameData(
    gameInfo: GameInfo.fromJson(json["game_info"]),
    yourPlayerInfo: json["your_player_info"],
    allPlayers: List<dynamic>.from(json["all_players"].map((x) => x)),
  );
}

class GameInfo {
  String id;
  String mode;
  String status;
  String gamePhase;
  int currentQuestion;
  int totalQuestions;
  String? currentPlayerId;
  Language language;
  String? roomCode;

  GameInfo({
    required this.id,
    required this.mode,
    required this.status,
    required this.gamePhase,
    required this.currentQuestion,
    required this.totalQuestions,
    this.currentPlayerId,
    required this.language,
    this.roomCode,
  });

  factory GameInfo.fromJson(Map<String, dynamic> json) => GameInfo(
    id: json["id"],
    mode: json["mode"],
    status: json["status"],
    gamePhase: json["game_phase"],
    currentQuestion: json["current_question"],
    totalQuestions: json["total_questions"],
    currentPlayerId: json["current_player_id"],
    language: Language.fromJson(json["language"]),
    roomCode: json["room_code"],
  );
}

class Language {
  String id;
  String name;

  Language({
    required this.id,
    required this.name,
  });

  factory Language.fromJson(Map<String, dynamic> json) => Language(
    id: json["id"],
    name: json["name"],
  );
}

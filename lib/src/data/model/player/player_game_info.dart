class PlayerGameInfoResponse {
  final bool success;
  final String? message;
  final PlayerGameData data;

  PlayerGameInfoResponse({
    required this.success,
    this.message,
    required this.data,
  });

  factory PlayerGameInfoResponse.fromJson(Map<String, dynamic> json) {
    return PlayerGameInfoResponse(
      success: json['success'],
      message: json['message'] ?? '',
      data: PlayerGameData.fromJson(json['data']),
    );
  }
}

class PlayerGameData {
  final PlayerGameSummary summary;
  final List<Game> games;

  PlayerGameData({
    required this.summary,
    required this.games,
  });

  factory PlayerGameData.fromJson(Map<String, dynamic> json) {
    return PlayerGameData(
      summary: PlayerGameSummary.fromJson(json['summary']),
      games: (json['games'] as List).map((gameJson) => Game.fromJson(gameJson)).toList(),
    );
  }
}

class PlayerGameSummary {
  final int totalGamesCreated;
  final int quickGamesCreated;
  final int gridStyleGamesCreated;

  PlayerGameSummary({
    required this.totalGamesCreated,
    required this.quickGamesCreated,
    required this.gridStyleGamesCreated,
  });

  factory PlayerGameSummary.fromJson(Map<String, dynamic> json) {
    return PlayerGameSummary(
      totalGamesCreated: json['total_games_created'],
      quickGamesCreated: json['quick_games_created'],
      gridStyleGamesCreated: json['grid_style_games_created'],
    );
  }
}

class Game {
  final String? gameId;

  Game({
    this.gameId,
  });

  factory Game.fromJson(Map<String, dynamic> json) {
    return Game(
      gameId: json['game_id'] ?? '',
    );
  }
}

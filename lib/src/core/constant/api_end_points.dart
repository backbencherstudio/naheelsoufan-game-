class ApiEndPoints{
  // BASE URL
  static const String baseUrl = "https://caroll-perihelial-nonnecessitously.ngrok-free.dev";

  // IMG BASE
  //static String imageBaseUrl = "https://nirob.signalsmind.com/s3";

  // QUE BASE
  static const String questionBaseUrl = "https://nirob.signalsmind.com/s3/public/storage/question";

  static String convertToS3Url(String localUrl) {
    final pathStart = localUrl.indexOf('https://firebasestorage.googleapis.com/');
    if (pathStart == -1) return localUrl;

    final storagePath = localUrl.substring(pathStart);
    return storagePath;
  }

  static String fileUrlPath(String? imgUrl) => "$questionBaseUrl/$imgUrl";

  static const String registerUrl = "$baseUrl/api/auth/register";
  static const String loginUrl = "$baseUrl/api/auth/login";
  static const String fetchDifficultiesUrl = "$baseUrl/api/admin/difficulties";
  static const String fetchUserDataUrl = "$baseUrl/api/auth/me";
  static const String updateProfile = "$baseUrl/api/auth/update";
  static const String changePassword = "$baseUrl/api/auth/change-password";

  //CREATE GAME
  static const String createGameUrl = "$baseUrl/api/games";
  static const String createOnlineGameUrl = "$baseUrl/api/multiplayer-game/create";

  // Select PLayers
  static const String selectPlayersUrl = "$baseUrl/api/game-players/quick-game/add-multiple-players";

  // Game Player Data
  static const String gamePlayerDataUrl = "$baseUrl/api/game-players/game";
  static const String gameStartUrl = "$baseUrl/api/game-players/start-game";
  static const String gameEndUrl = "$baseUrl/api/game-players/end-game";

  // Subscription
  static const String subscriptionUrl = "$baseUrl/api/subscription/types";
  // user subscription
  static const String userSubscriptionUrl = "$baseUrl/api/subscription/status";

  // Category
  static const String categoryUrl = "$baseUrl/api/admin/categories";

  // start game
  static const String startGameUrl = "$baseUrl/api/game-players/quick-game/select-category-and-start";
  // answer
  static const String answer = "$baseUrl/api/game-players/competitive-quick-game/answer";
  static const String skipAnswer = "$baseUrl/api/game-players/timeout-skiped";
  //  end game
  static String gameStatsUrl = "$baseUrl/api/game-players/end-game";

  // user game stats
  static String playerGameStats = "$baseUrl/api/games/player/games";

  //payment intent
  static String paymentIntentUrl = "$baseUrl/api/subscription/purchase";

  //last payment intent
  static String lastPaymentIntentUrl = "$baseUrl/api/subscription/my-subscriptions";
}
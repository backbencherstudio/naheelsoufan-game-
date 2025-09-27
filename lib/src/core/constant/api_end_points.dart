class ApiEndPoints{
  // BASE URL
  static const String baseUrl = "https://cognitively-undecaying-azalee.ngrok-free.dev";

  static const String registerUrl = "$baseUrl/api/auth/register";
  static const String loginUrl = "$baseUrl/api/auth/login";

  static const String fetchUserDataUrl = "$baseUrl/api/auth/me";

  //CREATE GAME
  static const String createGameUrl = "$baseUrl/api/games";

  // Game Player Data
  static const String gamePlayerDataUrl = "$baseUrl/api/game-players/game";
  static const String gameStartUrl = "$baseUrl/api/game-players/start-game";
  static const String gameEndUrl = "$baseUrl/api/game-players/end-game";
  static const String gameCategoryUrl = "$baseUrl/api/game-players/categories";

  // Subscription
  static const String subscriptionUrl = "$baseUrl/api/subscription/types";

  // Category
  static const String categoryUrl = "$baseUrl/api/admin/categories";
}
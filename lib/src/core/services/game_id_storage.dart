import 'package:shared_preferences/shared_preferences.dart';

class GameIdStorage {
  static const String gameIdKey = 'game_id';

  Future<String?> getGameId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(gameIdKey);
  }

  Future<void> setGameId(String? gameId) async{
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(gameIdKey, gameId ?? "No ID");
  }

  Future<void> removeGameId() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(gameIdKey);
  }
}
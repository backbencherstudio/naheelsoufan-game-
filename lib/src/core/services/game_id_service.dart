import 'package:shared_preferences/shared_preferences.dart';

class GameIdService{
  // GAME ID
  Future<String?> getGameId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('game_id');
  }

  Future<void> setGameId(String? id) async{
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('game_id', id ?? "No game_id");
  }

  Future<void> removeGameId() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('game_id');
  }
}
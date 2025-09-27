import 'package:shared_preferences/shared_preferences.dart';

class LanguageIdService {
  static const String languageKey = 'language';

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(languageKey);
  }

  Future<void> setToken(String? languageId) async{
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(languageKey, languageId ?? "No Token");
  }

  Future<void> removeToken() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(languageKey);
  }
}
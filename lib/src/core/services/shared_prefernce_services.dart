import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token');
  }

  Future<void> setToken(String? token) async{
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('auth_token', token ?? "No Token");
  }

  Future<void> removeToken() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('auth_token');
  }

}
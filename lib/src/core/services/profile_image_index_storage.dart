import 'package:shared_preferences/shared_preferences.dart';

class ProfileImageIndexStorage {
  static const String profileIndexKey = 'image_index';

  Future<int?> getProfileIndex() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(profileIndexKey);
  }

  Future<void> setProfileIndex(int? index) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt(profileIndexKey, index ?? 0);
  }

  Future<void> removeProfileIndex() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(profileIndexKey);
  }
}

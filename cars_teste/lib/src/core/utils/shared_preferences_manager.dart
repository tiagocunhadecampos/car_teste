import 'package:cars_teste/src/config/imports.dart';

class SharedPreferencesManager {
  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<void> saveTheme(bool isDarkTheme) async {
    await _prefs.setBool('isDarkTheme', isDarkTheme);
  }

  static bool? getTheme() {
    return _prefs.getBool('isDarkTheme');
  }

  static Future<void> clearAll() async {
    await _prefs.clear();
  }
}

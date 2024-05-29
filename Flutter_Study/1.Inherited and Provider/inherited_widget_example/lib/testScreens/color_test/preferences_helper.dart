import 'package:shared_preferences/shared_preferences.dart';

// ignore: avoid_classes_with_only_static_members
class PreferencesHelper {

  static Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  static Future<int?> getColorTheme(String key) async => (await prefs).getInt(key);

  static Future<bool> setColorTheme(String key, int value) async => (await prefs).setInt(key, value);
}
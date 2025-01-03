import 'package:optimal_prime/data/local/preferences_helper.dart';

class CacheService {
  Future<void> saveTheme({required bool isLight}) async {
    await PreferencesHelper.write(PrefsKeys.theme, isLight);
  }

  Future<bool> getTheme() async => await PreferencesHelper.read(PrefsKeys.theme) ?? true;

  Future<void> saveOnBoarding({required bool isFirstLoad}) async {
    await PreferencesHelper.write(PrefsKeys.isFirstLoad, isFirstLoad);
  }

  Future<bool> getOnBoarding() async => await PreferencesHelper.read(PrefsKeys.isFirstLoad) ?? true;

  Future<void> clearCache() async {
    await PreferencesHelper.clear();
  }
}

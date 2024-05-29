
import 'package:universal_realism_art/data/local/preferences_helper.dart';

class CacheService {

  Future<void> saveTheme({required bool isLight}) async{
    await PreferencesHelper.write(PrefsKeys.isLigthTheme, isLight);
  }

  Future<bool?> getTheme() async => PreferencesHelper.read(PrefsKeys.isLigthTheme);

  Future<void> clearCache() async{
    await PreferencesHelper.clear();
  }
}

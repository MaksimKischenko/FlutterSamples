
import 'package:universal_realism_art/data/data_manager.dart';
import 'package:universal_realism_art/domain/services/local_cache_service.dart';
import 'package:universal_realism_art/main.dart';


mixin AppInjector {
  static Future<void> run () async {
    getIt
    ..registerSingleton<DataManager>(
      DataManager()
    )    
     ..registerSingleton<CacheService>(
      CacheService());                                    
  }
}


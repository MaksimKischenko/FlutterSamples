import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:optimal_prime/domain/services/local_cache_service.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit({
    required CacheService cacheService,
  })  : _cacheService = cacheService,
        super(const ThemeState(isLight: true));

  final CacheService _cacheService;

  Future<void> getTheme() async {
    final isLight = await _cacheService.getTheme();
    emit(state.copyWith(isLight: isLight));
  }

  Future<void> onThemeChanged({required bool isLight}) async {
    await _cacheService.saveTheme(isLight: isLight);
    emit(state.copyWith(isLight: isLight));
  }
}

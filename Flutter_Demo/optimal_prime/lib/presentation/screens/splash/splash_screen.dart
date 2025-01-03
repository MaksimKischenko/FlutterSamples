import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:optimal_prime/data/repositories/battery_task_repository.dart';
import 'package:optimal_prime/domain/services/local_cache_service.dart';
import 'package:optimal_prime/generated/translations.g.dart';
import 'package:optimal_prime/presentation/screens/home/home_screen.dart';
import 'package:optimal_prime/presentation/screens/intro/intro_screen.dart';
import 'package:optimal_prime/utils/assets_provider.dart';
import 'package:optimal_prime/utils/build_context_extensions.dart';
import 'package:optimal_prime/utils/functions.dart';
import 'package:optimal_prime/utils/gaps.dart';
import 'package:optimal_prime/utils/sizes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String route = '/';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  static const int _bLoaderMinimumDurationInMilliseconds = 1000;
  final CacheService _cacheService = getdep<CacheService>();
  final BatteryTaskRepository _batteryTaskRepository = getdep<BatteryTaskRepository>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(
        const Duration(
          milliseconds: _bLoaderMinimumDurationInMilliseconds,
        ),
        () async {
          await _handleOnBoarding();
        },
      );
      if (!mounted) {
        return;
      }
      // await BossMoneyNavigator.onAppLaunch();
    });
  }

  Future<void> _handleOnBoarding() async {
    final isFirstLoad = await _cacheService.getOnBoarding();
    if (isFirstLoad) {
      await Future.wait([
        _batteryTaskRepository.init(),
        _cacheService.saveOnBoarding(isFirstLoad: false),
      ]);
      context.go(IntroScren.route);
    } else {
      context.go(HomeScreen.route);
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: context.colors.surface,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                LottieAsset.splashBattery,
                width: KSize.avatar3XL,
                height: KSize.avatar3XL,
                fit: BoxFit.contain,
              ),
              Gap.verticalMaterial,
              Text(
                context.t.mobileScreens.splash.loadingMessage,
                style: context.textTheme.bodyLarge,
              )
            ],
          ),
        ),
      );
}

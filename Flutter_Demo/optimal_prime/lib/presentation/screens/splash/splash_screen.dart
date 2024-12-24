import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:optimal_prime/generated/translations.g.dart';
import 'package:optimal_prime/presentation/screens/intro/intro_screen.dart';
import 'package:optimal_prime/utils/assets_provider.dart';
import 'package:optimal_prime/utils/build_context_extensions.dart';
import 'package:optimal_prime/utils/gaps.dart';
import 'package:optimal_prime/utils/sizes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String route = '/';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  static const int _bLoaderMinimumDurationInMilliseconds = 2500;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.wait([
        Future.delayed(
          const Duration(
            milliseconds: _bLoaderMinimumDurationInMilliseconds,
          ),
          () async {
            context.go(IntroScren.route);
          },
        ),
      ]);
      if (!mounted) {
        return;
      }
      // await BossMoneyNavigator.onAppLaunch();
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: context.colors.surface,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                LottieAsset.splash,
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

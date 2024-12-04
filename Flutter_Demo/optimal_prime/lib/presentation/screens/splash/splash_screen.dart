import 'package:flutter/material.dart';
import 'package:optimal_prime/presentation/screens/splash/widgets/splash_logo.dart';
import 'package:optimal_prime/utils/build_context_extensions.dart';

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
            // ensure that the animation plays at least once
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
        body: const SizedBox(
          child: Center(
            child: SplashLogo(
              isAnimated: true,
            ),
          ),
        ),
      );
}


// Lottie.asset(
//                   MinutesCallingAsset.preCallDialogLoading.path,
//                   fit: BoxFit.contain,
//                   package: 'minutes_calling',
//                 ),
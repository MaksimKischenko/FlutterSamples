import 'package:universal_realism_art/presentation/presentation.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {

  @override
  Widget build(BuildContext context) => Scaffold(
    body: BackgroundScopeWrapper(
      child: Center(
        child: CircularProgressIndicator(
        color: Theme.of(context).colorScheme.primary,
        backgroundColor: Theme.of(context).colorScheme.secondary,
      )),
    )
  );
}





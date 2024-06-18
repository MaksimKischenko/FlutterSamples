import 'package:flutter/material.dart';

import 'main_routes.dart';


class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const FlutterLogo(),
            MaterialButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const MyHomePage()));
              },
              child: const Text('NEXT'),
            )
          ],
        ),
      ),
    );
  }
}
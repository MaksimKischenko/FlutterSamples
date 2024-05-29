import 'package:flutter/material.dart';
import 'package:organization_simulation/widgets/widgets.dart';

class SplashScreen extends StatefulWidget {
  static const pageName = 'Loading';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    // WidgetsBinding.instance
    //     ?.addPostFrameCallback((_) => context.read<AuthBloc>().add(AuthCheck(getAbsolutePath(context))));
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          SizedBox(width: double.maxFinite),
          LoadingIndicator()
        ],
      ),
    );
}
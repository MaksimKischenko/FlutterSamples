import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/screens/screens.dart';
import 'package:untitled1/blocs/blocs.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        ?.addPostFrameCallback((_) => context.read<AuthBloc>().add(AuthInit()));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          _toHome();
        } else if (state is AuthUnauthorized) {
          _toAuth();
        }
      },
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: double.maxFinite),
            CircularProgressIndicator()
          ],
        ),
      ),
    );
  }

  void _toHome() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => HomeAuthScreen()),
        (route) => false);
  }

  void _toAuth() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => AuthScreen()),
        (route) => false);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/blocs/blocs.dart';
import 'package:untitled1/screens/screens.dart';

class HomeAuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthLogOutSuccess) {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => AuthScreen()),
              (route) => false);
        }
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text('Главная '),
          ),
          body: Column(
            children: [
              ElevatedButton.icon(
                  icon: Icon(Icons.exit_to_app_rounded),
                  label: Text("Exit"),
                  onPressed: () => context.read<AuthBloc>().add(AuthLogOut()))
            ],
          )),
    );
  }
}

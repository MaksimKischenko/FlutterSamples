import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/blocs/blocs.dart';

class AuthButton extends StatelessWidget {
  final Function() onTap;

  const AuthButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthLoading) {
          return SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(),
          );
        } else {
          return ElevatedButton(onPressed: onTap, child: Text("Auth"));
        }
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/blocs/blocs.dart';
import 'package:untitled1/screens/screens.dart';

import 'widgets/widgets.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();

  String? _login;

  String? _password;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {
          _showMessage(state.message);
        } else if (state is AuthSuccess) {
          _toHome();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Autorization"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(70.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: double.maxFinite),
                Container(
                  child: TextFormField(
                    decoration: InputDecoration(labelText: "Login"),
                    keyboardType: TextInputType.text,
                    onSaved: (value) => _login = value,
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Login is empty';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  child: TextFormField(
                    decoration: InputDecoration(labelText: "Password"),
                    obscureText: true,
                    onSaved: (value) => _password = value,
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Password is empty';
                      }
                      if (value!.length < 6) {
                        return 'Password min length 6';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 16),
                AuthButton(onTap: _onAuthTap)
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showMessage(String text) =>
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(text),
      ));

  void _onAuthTap() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      context
          .read<AuthBloc>()
          .add(AuthRun(login: _login ?? '', password: _password ?? ''));
    }
  }

  void _toHome() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => HomeAuthScreen()),
        (route) => false);
  }
}

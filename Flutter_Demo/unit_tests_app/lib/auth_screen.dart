import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginDesign extends StatelessWidget {
  final emailAddressController =
      TextEditingController(text: 'calendar_test@gmail.com');
  final passwordController = TextEditingController(text: 'password');

  LoginDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
          backgroundColor: Colors.orange
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 60.0,
                width: 300.0,
                child: TextField(
                  key: const Key('email'),
                  controller: emailAddressController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              SizedBox(
                height: 60.0,
                width: 300.0,
                child: TextFormField(
                  key: const Key('password'),
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                height: 60.0,
                width: 300.0,
                child: ElevatedButton(
                  key: const Key('login_btn'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Colors.orange,
                    ),
                  ),
                  onPressed: () {
                    print('Text field input - ${emailAddressController.text}');
                  },
                  child: const Text(
                    'Login',                  
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
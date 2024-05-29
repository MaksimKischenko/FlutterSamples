import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'widgets/widgets.dart';

class TaxiSignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign in'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36),
        child: Column(
          children: [
            Expanded(
              child: Column(
                //! для адаптивности
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('EMAIL',
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 13,
                          fontWeight: FontWeight.w700)),
                  SizedBox(height: 8),
                  TextField(
                    //controller: _searchController,
                    showCursor: false,
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      isDense: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none),
                      // icon:
                    ),
                  ),
                  SizedBox(height: 16),
                  Text('PASSWORD',
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 13,
                          fontWeight: FontWeight.w700)),
                  SizedBox(height: 8),
                  TextField(
                    showCursor: false,
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      isDense: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none),
                      suffixIcon: Icon(Icons.visibility_off,
                          color: Colors.grey.shade500, size: 20),
                      // icon:
                    ),
                  ),
                  SizedBox(height: 50),
                  MaterialButton(
                      padding:
                          EdgeInsets.symmetric(horizontal: 36, vertical: 22),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      onPressed: () {},
                      color: Colors.blue,
                      child: Text('Sign in',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w700))),
                  SizedBox(height: 50),
                  SocialAuth(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(32),
              child: Center(
                child: RichText(
                    text: TextSpan(
                        text: 'Don’t have an account? ',
                        style: TextStyle(
                          color: Colors.grey[400],
                        ),
                        children: [
                      TextSpan(
                          text: 'Sign up',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              print('On tap');
                            },
                          style: TextStyle(
                            color: Colors.blue,
                          ))
                    ])),
              ),
            )
          ],
        ),
      ),
    );
  }
}

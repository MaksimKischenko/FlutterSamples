import 'package:flutter/material.dart';

import 'widgets/widgets.dart';

class SportMainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20),
              FootballerItem(),
              SizedBox(height: 46),
              Text('Dicover all\nabout sport',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w600)),
              SizedBox(height: 14),
              Text(
                  "Search millions of jobs and get the\ninside scoop on companies.\nWait for what? Let’s get start it!",
                  style: TextStyle(
                      color: Color(0xff65656B),
                      fontSize: 16,
                      fontWeight: FontWeight.w400)),
              SizedBox(height: 44),
              SignItem()
            ],
          ),
        ),
      ),
    );
  }
}

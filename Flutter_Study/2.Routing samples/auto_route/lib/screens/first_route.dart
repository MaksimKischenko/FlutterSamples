
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../config/routes.gr.dart';

import 'second_route.dart';

class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Route'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Open route'),
          onPressed: () {
            AutoRouter.of(context).push(const SecondPage());  //pushNamed('/second-route');
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => SecondRoute()),
            // );

          },
        ),
      ),
    );
  }
}
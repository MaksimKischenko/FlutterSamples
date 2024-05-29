import 'package:flutter/material.dart';

class NavigatorRouteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Route'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Open route'),
          onPressed: () async {
            final value = await Navigator.push<String>(
              context,
              MaterialPageRoute(builder: (context) => SecondRoute()),
            );
            if (value != null) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(value)));
            }
          },
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ThirdRoute()));
              },
              child: Text('Go more!'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop<String>('Hello and go back');
              },
              child: Text('Go back!'),
            )
          ],
        ),
      ),
    );
  }
}

class ThirdRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Third Route"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => NavigatorRouteScreen(),
                ),
                (route) => false);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}

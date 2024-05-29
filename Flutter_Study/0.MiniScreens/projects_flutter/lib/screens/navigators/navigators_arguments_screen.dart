import 'package:flutter/material.dart';

class NavigatorArgumentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (settings) {
        if (settings.name == PassArgumentsScreen.routeName) {
          final ScreenArguments args = settings.arguments as ScreenArguments;
          return MaterialPageRoute(
            builder: (context) {
              return PassArgumentsScreen(
                screenArguments: args,
              );
            },
          );
        }
        assert(false, 'Need to implement ${settings.name}');
        return null;
      },
      title: 'Navigation with Arguments',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: Text("Navigate to a named that accepts arguments"),
              onPressed: () {
                Navigator.of(context).pushNamed(
                  PassArgumentsScreen.routeName,
                  arguments: ScreenArguments(
                    'Accept Arguments Screen',
                    'This message is extracted in the onGenerateRoute function.',
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class PassArgumentsScreen extends StatelessWidget {
  static const routeName = '/passArguments';

  final ScreenArguments screenArguments;

  const PassArgumentsScreen({
    Key? key,
    required this.screenArguments,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(screenArguments.title),
      ),
      body: Center(
        child: Text(screenArguments.message),
      ),
    );
  }
}

class ScreenArguments {
  final String title;
  final String message;

  ScreenArguments(this.title, this.message);
}

import 'package:flutter/material.dart';

import 'main_routes.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  SecondPageState createState() => SecondPageState();
}

class SecondPageState extends State<SecondPage> with RouteAware {
  @override
  void didPush() {
    debugPrint('SecondPage: Called didPush');
    super.didPush();
  }

  @override
  void didPop() {
    debugPrint('SecondPage: Called didPop');
    super.didPop();
  }

  @override
  void didPopNext() {
    debugPrint('SecondPage: Called didPopNext');
    super.didPopNext();
  }

  @override
  void didPushNext() {
    debugPrint('SecondPage: Called didPushNext');
    super.didPushNext();
  }

  @override
  void didChangeDependencies() {
    routeObserver.subscribe(this, ModalRoute.of(context) as PageRoute);
    super.didChangeDependencies();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: const Text('Second Page'),
      ),
      body: const Center(
        child: Text(
          "Flutter Dev's",
          style: TextStyle(fontSize: 35.0),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

import 'main.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> with RouteAware {
  @override
  void didPush() {
    print('SecondPage: Called didPush');
    super.didPush();
  }

  @override
  void didPop() {
    print('SecondPage: Called didPop');
    super.didPop();
  }

  @override
  void didPopNext() {
    print('SecondPage: Called didPopNext');
    super.didPopNext();
  }

  @override
  void didPushNext() {
    print('SecondPage: Called didPushNext');
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
        title: Text('Second Page'),
      ),
      body: Center(
        child: Text(
          "Flutter Dev's",
          style: TextStyle(fontSize: 35.0),
        ),
      ),
    );
  }
}
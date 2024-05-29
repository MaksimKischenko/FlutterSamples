import 'package:flutter/material.dart';

class FreaLancerScreen extends StatefulWidget {

  static String pageName = 'Frealancer menu';
  
  @override
  _FreaLancerScreenState createState() => _FreaLancerScreenState();
}

class _FreaLancerScreenState extends State<FreaLancerScreen> {


  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text('FREALANCER'),
    );
  }
}
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BadExampleWidget extends StatefulWidget {
  const BadExampleWidget({super.key});

  @override
  State<BadExampleWidget> createState() => _BadExampleWidgetState();
}

class _BadExampleWidgetState extends State<BadExampleWidget> {

 var value = 0;

 void loadValue () async {
   final shPref = await SharedPreferences.getInstance();
   value = shPref.getInt('age') ?? 0;
   setState(() {});  
 }

 @override
  void initState() {
    super.initState();
    loadValue();
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('$value'),
              ElevatedButton(
                onPressed: () async {
                  value = value + 1;
                  final shPref = await SharedPreferences.getInstance();
                  shPref.setInt('age', value);
                  setState(() {});
                }, 
                child: const Text('+')
              ),
              ElevatedButton(
                onPressed: () async{
                  value = max(value - 1, 0);
                  final shPref = await SharedPreferences.getInstance();
                  shPref.setInt('age', value); 
                  setState(() {});                  
                }, 
                child: const Text('-')
              )            
            ],
          ),
        ),
      )
    );
  }
}
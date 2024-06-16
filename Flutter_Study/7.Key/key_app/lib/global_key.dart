import 'package:flutter/material.dart';

final key =  GlobalKey<_AwesomeTextState>();

class ExampleGlobalKey extends StatelessWidget {
  const ExampleGlobalKey({ Key? key }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () => key.currentState?._increment(), 
          child: const Text('Rise')
        ),
        AwesomeText(
          key:key
        )
      ],
    );
  } 
}


class AwesomeText extends StatefulWidget {
  const AwesomeText({ Key? key }) : super(key: key);

  @override
  _AwesomeTextState createState() => _AwesomeTextState();
}

class _AwesomeTextState extends State<AwesomeText> {

  var _value = 0;
  void _increment() {
    _value+=1;
    setState(() {
      
    });
  }
  @override
  Widget build(BuildContext context) {
    return Text('$_value');
  }
}
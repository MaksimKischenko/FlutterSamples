import 'package:flutter/material.dart';

class Person2 extends StatefulWidget {
  Person2({Key? key}) : super(key: key);

  @override
  _PersonState createState() => _PersonState();
}

class _PersonState extends State<Person2> {
  String _name = "Tom";
  final _controller = TextEditingController();

  _changeName() {
    setState(() => _name = _controller.text);
  }

  @override
  void initState() {
    super.initState();
    _controller.text = _name;
    _controller.addListener(_changeName);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text("Имя пользователя: $_name", style: TextStyle(fontSize: 22)),
      TextField(style: TextStyle(fontSize: 22), controller: _controller)
    ], crossAxisAlignment: CrossAxisAlignment.start);
  }
}

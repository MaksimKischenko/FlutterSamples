import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      // Remove the debug banner
      debugShowCheckedModeBanner: false,
      title: 'Example.bl',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? _selectedValue;
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CupertinoSegmentedControl<String>(
                children: {
                  'a': _item('a'),
                  'b': _item('b'),
                  'c': _item('c'),
                  'd': _item('d'),
                },
                onValueChanged: (value) {
                  setState(() {
                    _selectedValue = '$value class';
                  });
                },
              ),
              SizedBox(height: 30),
              if (_selectedValue != null)
                Text(
                  _selectedValue!,
                  style: TextStyle(fontSize: 50),
                )
            ],
          ),
        ),
      ),
    );
  }

  Widget _item(String name) {
    return Container(
      color: _selectedValue == '$name class' ? Colors.blue[100] : Colors.white,
      padding: EdgeInsets.all(8),
      child: Text('$name'),
    );
  }
}

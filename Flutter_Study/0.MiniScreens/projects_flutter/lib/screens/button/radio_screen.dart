import 'package:flutter/material.dart';

enum SingingCharacter { lafayette, jefferson }

/// This is the stateful widget that the main application instantiates.
class MyRadioScreen extends StatefulWidget {
  const MyRadioScreen({Key? key}) : super(key: key);

  @override
  _MyRadioScreenState createState() => _MyRadioScreenState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyRadioScreenState extends State<MyRadioScreen> {
  SingingCharacter? _character = SingingCharacter.jefferson;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          ListTile(
            title: const Text('Lafayette'),
            leading: Radio<SingingCharacter>(
              value: SingingCharacter.lafayette,
              groupValue: _character,
              onChanged: (value) {
                setState(() {
                  _character = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Thomas Jefferson'),
            leading: Radio<SingingCharacter>(
              value: SingingCharacter.jefferson,
              groupValue: _character,
              onChanged: (value) {
                setState(() {
                  _character = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

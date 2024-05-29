import 'package:flutter/material.dart';

enum SingingCharacter { 
  lafayette, jefferson 
}

/// This is the stateful widget that the main application instantiates.
class RadioScreen extends StatefulWidget {
  
  static String routeName = '/_elementsDemos/07_radio';

  @override
  _RadioScreenState createState() => _RadioScreenState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _RadioScreenState extends State<RadioScreen> {
  SingingCharacter? _character = SingingCharacter.jefferson;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Radio'),
      ),
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

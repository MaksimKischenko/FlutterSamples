

import 'package:flutter/material.dart';

class UiFirst extends StatefulWidget {
  const UiFirst({Key? key}) : super(key: key);

  @override
  State<UiFirst> createState() => _UiFirstState();
}

class _UiFirstState extends State<UiFirst> {

  bool _showMessage = false;
  static const TextStyle textStyle = TextStyle(color: Colors.red);
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(

      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 400,
              height: 150,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Positioned(
                    bottom: 0,
                    child: OutlinedButton(
                      child: const Text('Show Message'),
                      onPressed: () => setState(() { _showMessage = true; }),
                    ),
                  ),
                  BlockSemantics(
                    blocking: _showMessage,
                    child: Visibility(
                      visible: _showMessage,
                      child: _buildMessage(),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessage() {
  return Card(
    color: Colors.cyan[50],
    child: SizedBox(
      width: 200,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
           const ListTile(
            leading: Icon(Icons.abc),
            title:  Text('BlockSemantics Demo', style: textStyle),
            subtitle: Text('by Flutter Devs', style: textStyle),
          ),
          ButtonTheme(
            child: ButtonBar(
              children: [
                TextButton(
                  child: const Text('OK', style: textStyle),
                  onPressed: () => setState(() { _showMessage = false; }),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
}


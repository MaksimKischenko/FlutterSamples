import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GlobalKeyScreen extends StatefulWidget {
  static String routeName = '/_fitchesDemos/06_GlobalKey';

  @override
  _GlobalKeyScreenState createState() => _GlobalKeyScreenState();
}

class _GlobalKeyScreenState extends State<GlobalKeyScreen> {

  final GlobalKey _firstKey = GlobalKey();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text('GlobalKey'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 400,
                width: 400,
                alignment: Alignment.center,
                color: Colors.lightBlue,
                child: Container(
                  key: _firstKey,
                  height: 200,
                  width: 200,
                  color: Colors.blueGrey,
                ),
              ),
              CupertinoButton(
                child: Text('Change with a key'), 
                onPressed: () => 
                //info
                //print(((_firstKey.currentWidget as Container).color as Color)))
                setState(()=> _firstKey.currentContext as BuildContext )
                
              )
            ],
          ),
        ),
    );
  }
}
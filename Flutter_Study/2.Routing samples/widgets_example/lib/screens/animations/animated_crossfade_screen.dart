import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



//AnimatedDefaultTextStyle

class AnimatedCrossFadeScreen extends StatefulWidget {
  static String routeName = '/_animationsDemos/01_AnimatedCrossFade';

  @override
  _AnimatedCrossFadeScreenState createState() => _AnimatedCrossFadeScreenState();
}

class _AnimatedCrossFadeScreenState extends State<AnimatedCrossFadeScreen> {

  var _showFirst = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('AnimatedCrossFade'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedCrossFade(
              firstChild: FlutterLogo(
                style: FlutterLogoStyle.horizontal,
                size: 100,
              ), 
              secondChild: FlutterLogo(
                style: FlutterLogoStyle.stacked,
                size: 100,
              ), 
              crossFadeState: _showFirst? 
              CrossFadeState.showFirst:
              CrossFadeState.showSecond, 
              duration: Duration(seconds: 2)
            ),
            CupertinoButton(
              child: Text('Cross-Fade'),
              color: Theme.of(context).accentColor,
              onPressed: () { 
                setState(() {
                _showFirst= !_showFirst;
               });
              }
            ) 
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class AnimatedSizeScreen extends StatefulWidget {
  const AnimatedSizeScreen({Key? key}) : super(key: key);

  @override
  State<AnimatedSizeScreen> createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<AnimatedSizeScreen>
    with SingleTickerProviderStateMixin {
  double _size = 50.0;
  bool _large = false;

  void _updateSize() {
    setState(() {
      _size = _large ? 250.0 : 100.0;
      _large = !_large;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _updateSize(),
      child: Container(
        color: Colors.amberAccent,
        child: AnimatedSize(
          curve: Curves.easeIn,
          duration: const Duration(seconds: 1),
          vsync: this,
          child: FlutterLogo(size: _size),
        ),
      ),
    );
  }
}

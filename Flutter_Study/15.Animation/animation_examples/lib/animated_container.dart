import 'package:flutter/material.dart';

class AnimatedContainerExample extends StatefulWidget {
  const AnimatedContainerExample({ Key? key }) : super(key: key);

  @override
  State<AnimatedContainerExample> createState() => _AnimatedContainerExampleState();
}

class _AnimatedContainerExampleState extends State<AnimatedContainerExample> {

  bool _bigger = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: AnimatedContainer(
                width: _bigger? 100 : 10,
                duration: const Duration(seconds: 2),
                child: Image.asset('assets/image.png'),
                curve: Curves.easeInOutQuint,
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    colors: const [Colors.purple, Colors.blue],
                    stops: [_bigger? 0.2: 0.5, 1.0]
                  )
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _bigger = !_bigger;
                });
              }, 
              child: const Text('Press')
            )
          ],
        ),
    );
  }
}
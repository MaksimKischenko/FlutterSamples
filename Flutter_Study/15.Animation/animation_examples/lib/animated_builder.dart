import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: const FlutterLogo(),
      width: 200,
      height: 200,
    );
  }
}


class GrowTransition extends StatelessWidget {

  final Widget child;
  final Animation animation;

  const GrowTransition({
    Key? key,
    required this.child,
    required this.animation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animation, 
        builder: (context, child) {
          return SizedBox(
            height: animation.value,
            width: animation.value,
            child: child,
          );
        }
      ),
    );
  }
}

class AnimatedBuilderExample extends StatefulWidget {
  const AnimatedBuilderExample({Key? key}) : super(key: key);

  @override
  _AnimatedBuilderExampleState createState() => _AnimatedBuilderExampleState();
}

class _AnimatedBuilderExampleState extends State<AnimatedBuilderExample> with SingleTickerProviderStateMixin {

  late Animation<double> animation;
  late AnimationController controller;


  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3)
    );
    animation = Tween<double>(begin: 0, end: 300).animate(controller);
    controller.forward();
  }

  @override
    void dispose() {
      controller.dispose();
      super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return GrowTransition(
      animation: animation,
      child: const LogoWidget(),
    );
  }
}
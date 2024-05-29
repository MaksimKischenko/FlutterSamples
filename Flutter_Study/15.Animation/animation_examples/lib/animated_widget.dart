import 'package:flutter/material.dart';



class AnimatedLogo extends AnimatedWidget {
  const AnimatedLogo({Key? key, required Animation<double> animation})
    : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        height: animation.value,
        width: animation.value,
        child: const FlutterLogo(),
      ),
    );
  }
}


class LogoApp2 extends StatefulWidget {
  const LogoApp2({Key? key}) : super(key: key);

  @override
  _LogoApp2State createState() => _LogoApp2State();
}

class _LogoApp2State extends State<LogoApp2> with SingleTickerProviderStateMixin {

  late Animation<double> animation;
  late AnimationController controller;


  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2)
    );
    animation =  Tween<double>(begin: 0, end: 300).animate(controller)..
    addStatusListener((status) {
      if(status == AnimationStatus.completed) {
        controller.reverse();
      } else if(status == AnimationStatus.dismissed) {
        controller.forward();
      }
    })
    ..addStatusListener((status) {
      print(status);
    });

    controller.forward();
  }

  @override
    void dispose() {
      controller.dispose();
      super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return AnimatedLogo(
      animation: animation,
    );
  }
}
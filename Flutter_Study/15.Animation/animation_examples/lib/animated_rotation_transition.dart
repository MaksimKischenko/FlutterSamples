import 'package:flutter/material.dart';

class AnimatedRotationTransition extends StatefulWidget {
  const AnimatedRotationTransition({ Key? key }) : super(key: key);

  @override
  State<AnimatedRotationTransition> createState() => _AnimatedRotationTransitionState();
}
                                                                                      //единный таймер для всех анимаций
class _AnimatedRotationTransitionState extends State<AnimatedRotationTransition> with SingleTickerProviderStateMixin {

  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2)
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rotation'),
        centerTitle: true,
      ),
      body: Center(
        child: SizedBox(
          height: 300,
          child: Stack(
           children: [
             RotationTransition(
               turns: controller,
               child: const Icon(Icons.phone, size: 80),
             )
           ]
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if(controller.isAnimating) {
            controller.stop();
          } else {
            controller.repeat();
          }
          setState(() {
            
          });
        },
        child: controller.isAnimating? const Icon(Icons.stop) : const Icon(Icons.play_arrow),
      ),
    );
  }
}
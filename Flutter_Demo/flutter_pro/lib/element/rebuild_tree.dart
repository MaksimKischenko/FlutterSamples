import 'dart:developer';
import 'package:flutter/material.dart';



void main() => runApp(const MaterialApp(home: RebuildTree()));

class RebuildTree extends StatefulWidget {
  const RebuildTree({super.key});

  @override
  State<RebuildTree> createState() => _RebuildTreeState();
}

class _RebuildTreeState extends State<RebuildTree> {
  @override
  Widget build(BuildContext context) {
    log('REBUILD RebuildTree');
    return const Scaffold(body: Center(child: Switcher()));
  }
}



class Switcher extends StatefulWidget {
  const Switcher({super.key});

  @override
  State<Switcher> createState() => _SwitcherState();
}

class _SwitcherState extends State<Switcher> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        OutlinedButton(
          onPressed: () {
            setState(() {
              log('REBUILD Switcher');
            });
          }, 
          child: const Text('REBUILD')
        ),
         const SwitcherChild()
      ],
    );
  }
}


class SwitcherChild extends StatefulWidget {
  const SwitcherChild({super.key});

  @override
  State<SwitcherChild> createState() => _SwitcherChildState();
}

class _SwitcherChildState extends State<SwitcherChild> {
  @override
  Widget build(BuildContext context) {
    log('REBUILD SwitcherChild');
    return Container();
  }
}
import 'dart:developer';

import 'package:flutter/material.dart';

class DisposerExampleView extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  const DisposerExampleView({
    super.key,
    required this.controller,
    required this.focusNode,
  });

  void dispose() {
    //here
    controller.dispose();
    focusNode.dispose();
    debugPrint('controller and focusNode were disposed');
  }

  @override
  Widget build(BuildContext context) {
    log('REBUILD DisposerExampleView');
    return Center(
        child: Column(
      children: [
        TextField(
          focusNode: focusNode,
          controller: controller,
        ),
        Disposer(dispose: dispose), //and here
      ],
    ));
  }
}

class Disposer extends StatefulWidget {
  final void Function() dispose;
  const Disposer({super.key, required this.dispose});

  @override
  DisposerState createState() {
    return DisposerState();
  }
}

class DisposerState extends State<Disposer> {
  @override
  Widget build(BuildContext context) {
    log('REBUILD Disposer');
    return const SizedBox.shrink();
  }

  @override
  void dispose() {
    widget.dispose();
    log('dispose');
    super.dispose();
  }
}

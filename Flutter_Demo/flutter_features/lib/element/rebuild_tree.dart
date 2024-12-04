import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_features/features/disposer.dart';

void main() => runApp(const MaterialApp(home: RebuildTree()));

class RebuildTree extends StatefulWidget {
  const RebuildTree({super.key});

  @override
  State<RebuildTree> createState() => _RebuildTreeState();
}

class _RebuildTreeState extends State<RebuildTree> {
  @override
  Widget build(BuildContext context) {
    log('REBUILD TOP'); //TODO? Do not rebuilds
    return const Scaffold(body: Center(child: Switcher()));
  }
}

class Switcher extends StatefulWidget {
  const Switcher({super.key});

  @override
  State<Switcher> createState() => _SwitcherState();
}

class _SwitcherState extends State<Switcher> {
  TextEditingController controller = TextEditingController();
  FocusNode focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    log('REBUILD Switcher'); //TODO? rebuilds by setState
    log('CHECK HASH: ${controller.hashCode}');
    return Column(
      // key: UniqueKey(), //will rebuild SwitcherChild even if it const
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        OutlinedButton(
            onPressed: () {
              setState(() {});
            },
            child: const Text('REBUILD')),
        const SwitcherChild(),
        DisposerExampleView(
          focusNode: focusNode,
          controller: controller,
        )
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
  void didUpdateWidget(covariant SwitcherChild oldWidget) {
    debugPrint('PARENT UPDATED ${oldWidget.runtimeType}');
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    log('REBUILD SwitcherChild'); //TODO? Do not rebuilds
    return Container();
  }
}

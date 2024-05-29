import 'package:flutter/material.dart';

class ContextContainer extends StatefulWidget {
  const ContextContainer({super.key});

  @override
  State<ContextContainer> createState() => _ContextContainerState();
}

class _ContextContainerState extends State<ContextContainer> {
  @override
  Widget build(BuildContext context) {
    var t = context.findAncestorWidgetOfExactType<Scaffold>();
    var r = context.findAncestorRenderObjectOfType();
    print(t);  
    print(r);  
    return Container();
  }
}
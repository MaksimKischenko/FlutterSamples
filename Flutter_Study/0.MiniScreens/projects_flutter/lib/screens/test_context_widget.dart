import 'package:flutter/material.dart';

class TestContext extends StatefulWidget {
  const TestContext({ Key? key }) : super(key: key);

  @override
  State<TestContext> createState() => _TestContextState();
}

class _TestContextState extends State<TestContext> {

  String? info;

  @override
  void initState() {
    super.initState();
    var element = context.getElementForInheritedWidgetOfExactType();
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        key: widget.key,
        child: Center(child: Text('${1}')),
      ),
    );
  }
}
import 'package:flutter/material.dart';

import 'package:widgets_example/models/demo.dart';


class HomeScreen extends StatelessWidget {

  final List<Demo> layoutDemos;
  final List<Demo> fieldsDemos;
  final List<Demo> elementsDemos;
  final List<Demo> viewsDemos;
  final List<Demo> fithesDemos;
  final List<Demo> animationsDemos;

  const HomeScreen({
    Key? key,
    required this.layoutDemos,
    required this.fieldsDemos,
    required this.elementsDemos,
    required this.viewsDemos,
    required this.fithesDemos,
    required this.animationsDemos
  }) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    final headerStyle = Theme.of(context).textTheme.headline6;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('WidgetsExampleApp'),
      ),
      body: ListView(
        children: [
          ExpansionTile(
            title: Text('LAYOUT', style: headerStyle),
            children: [
              ...layoutDemos.map((e) => DemoTile(demo: e))
            ],
          ),
          ExpansionTile(
            title: Text('FIELDS', style: headerStyle),
            children: [
              ...fieldsDemos.map((e) => DemoTile(demo: e))
            ],
          ),
          ExpansionTile(
            title: Text('ELEMENTS', style: headerStyle),
            children: [
              ...elementsDemos.map((e) => DemoTile(demo: e))
            ],
          ),
          ExpansionTile(
            title: Text('VIEWS', style: headerStyle),
            children: [
              ...viewsDemos.map((e) => DemoTile(demo: e))
            ],
          ),
          ExpansionTile(
            title: Text('FITCHES', style: headerStyle),
            children: [
              ...fithesDemos.map((e) => DemoTile(demo: e))
            ],
          ),
          ExpansionTile(
            title: Text('ANIMATIONS', style: headerStyle),
            children: [
              ...animationsDemos.map((e) => DemoTile(demo: e))
            ],
          ),
        ],
      ),
    );
  }
}

class DemoTile extends StatelessWidget {
  final Demo demo;

  const DemoTile({required this.demo, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(demo.name),
      onTap: () {
        Navigator.pushNamed(context, demo.route);
      },
    );
  }
}
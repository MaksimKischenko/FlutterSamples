import 'package:flutter/material.dart';
import 'package:widgets_example/widgets/widgets.dart';

class MenuBottomScreen extends StatefulWidget {


  static String routeName = '/_fieldsDemos/03_menuBottom';

  @override
  _MenuBottomScreenState createState() => _MenuBottomScreenState();
}

class _MenuBottomScreenState extends State<MenuBottomScreen> {

  int _menuIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text('MenuBottom'),
      centerTitle: true,
    ),
    body: Align(
      alignment: Alignment.bottomCenter,
      child: MenuBottom(
        selectedIndex: _menuIndex,
        onTap: (selected) => setState(() => _menuIndex = selected),
      ),
    ),
    );
  }
}
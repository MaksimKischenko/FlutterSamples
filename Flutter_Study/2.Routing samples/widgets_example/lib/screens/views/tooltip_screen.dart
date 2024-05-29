import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:widgets_example/widgets/widgets.dart';

class ToolTipScreen extends StatefulWidget {
  
  static String routeName = '/_viewsDemos/02_ToolTipScreen';

  @override
  _ToolTipScreenState createState() => _ToolTipScreenState();
}

class _ToolTipScreenState extends State<ToolTipScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('ToolTipScreen'),
      ),
      body: CabinetMenuItem(
          selected: true,
          onTap: () => Navigator.pop(context),
          icon: CupertinoIcons.building_2_fill,
          text: 'Example',
        ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:widgets_example/widgets/widgets.dart';

class TippingsScreen extends StatefulWidget {

  static String routeName = '/_fieldsDemos/02_tippingelement';

  @override
  _TippingsScreenState createState() => _TippingsScreenState();
}

class _TippingsScreenState extends State<TippingsScreen> {

  int? _tip;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text('TippingElement'),
      centerTitle: true,
      ),
      body: Center(
        child: Tippings(
          value: _tip,
          onTap: (value) {
            setState(() {
              _tip = value;
            });
          },
        ),
      ) 
    );
  }
}

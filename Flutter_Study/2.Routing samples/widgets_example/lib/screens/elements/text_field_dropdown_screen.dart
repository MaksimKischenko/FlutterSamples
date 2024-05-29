import 'package:flutter/material.dart';
import 'package:widgets_example/widgets/widgets.dart';

class TextFieldDropdownScreen extends StatefulWidget {

  static String routeName = '/_elementsDemos/10_TextFieldDropdown';
  

  @override
  _TextFieldDropdownScreenState createState() => _TextFieldDropdownScreenState();
}

class _TextFieldDropdownScreenState extends State<TextFieldDropdownScreen> {


  List<String> names = [
    'Max',
    'Oleg',
    'Jony',
    'Gomez'
  ];

   String? selected;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('TextFieldDropdown'),
      ),
      body: Center(
        child: TextFieldDropdown<String>(
            title: 'Names',
            items: names,
            itemBuilder: (item) => item,
            selected: selected,
            onTap: (item) => selected = item,
          ),
      ),
    );
  }
}
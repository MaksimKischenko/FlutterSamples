import 'package:flutter/material.dart';

extension TextFormStyle on TextStyle {
  
  TextStyle setFontSizeMainWidget() => const TextStyle(
    fontSize: 16,
    color: Colors.black38,
    wordSpacing: 24,
  ); 
}


extension TextLayout on Text {
  Container uiTextInContainer() => Container(
    height: 44,
    width: 44,
    color: Colors.amber,
    child: Center(
      child: this
    ),
  );
}


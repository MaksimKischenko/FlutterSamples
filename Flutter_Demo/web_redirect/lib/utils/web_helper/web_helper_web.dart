// ignore_for_file: unsafe_html
import 'dart:html' as html;

import 'open_type.dart';

void redirectTo(String url, {OpenType openType = OpenType.firstBook}) {
  if (openType == OpenType.kufar) {
    // add more paramerter to options like 'location=yes,height=570,width=520,scrollbars=yes,status=yes'
    html.window.open(url,'Kufar');
  } else if (openType == OpenType.onliner) {
    html.window.open(url,'Onliner');
  } else if (openType == OpenType.firstBook) {
    html.window.open(url,'FirstBook');
  } else if (openType == OpenType.secondBook) {
    html.window.open(url,'SecondBook');
  } 
}
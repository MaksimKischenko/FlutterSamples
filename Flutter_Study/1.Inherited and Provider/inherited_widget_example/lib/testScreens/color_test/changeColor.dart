import 'package:flutter/material.dart';

import 'preferences_helper.dart';

class AppStyles extends ChangeNotifier {

  static Color mainColor = const Color(0xff172030);

  Future<void> generateMainColor() async {
    int? colorValue = 0xff172030;
    colorValue = await PreferencesHelper.getColorTheme('mainColor');
    mainColor = Color(colorValue ?? 0xff172030);
    notifyListeners(); 
  }
}


class AppStylesProvider extends InheritedNotifier<AppStyles> {

 final AppStyles model;

 const AppStylesProvider({
    required Widget widget,
    required this.model,
    Key? key
  }) : super(key: key, notifier: model, child: widget);


  static AppStyles? watch(BuildContext context) => context.dependOnInheritedWidgetOfExactType<AppStylesProvider>()?.notifier;

  //Более адекватный пример для того чтобы не было дополнительных обновлений build()
  static AppStyles? read(BuildContext context) {
    final widget = context.getElementForInheritedWidgetOfExactType<AppStylesProvider>()?.widget;
    return widget is AppStylesProvider ? widget.notifier : null;
  }
 
}

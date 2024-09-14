import 'package:flutter/widgets.dart';

extension ContextExtensions on BuildContext {
  T? args<T>() {
    if (ModalRoute.of(this) != null) {
      final args = ModalRoute.of(this)!.settings.arguments;
      if (args is T) {
        return args;
      }
    }
    return null;
  }
}

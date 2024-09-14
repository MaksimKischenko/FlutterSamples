import 'package:flutter/material.dart';

/// An Extension on [BuildContext]
extension BuildContextExtensions on BuildContext {
  /// Get the [ThemeData]
  ThemeData get theme => Theme.of(this);

  /// Get the [TextTheme]
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// Get the [TextStyle]
  
  /// Get the [ColorScheme]
  ColorScheme get colors => Theme.of(this).colorScheme;

  /// Get the height of the screen
  double get height => MediaQuery.sizeOf(this).height;

  /// Get the width of the screen
  double get width => MediaQuery.sizeOf(this).width;

  /// Get the [TextScaler] from the [MediaQuery]
  TextScaler get textScaler => MediaQuery.textScalerOf(this);

  /// Returns the recommended bottom padding size between the bottom screen edge and the content.
  /// Basically it's either `SafeArea.bottom` or 16px.
  ///
  /// The reason why we should use it is that if the device has a SafeArea it doesn't need an extra
  /// bottom padding, the content looks good (note: not only iPhones have SafeArea). If the SafeArea
  /// is 0 then we should provide 16px so that content has some space below. Using both will give us
  /// too much space on devices with SafeArea.
  double get safeBottomPadding {
    final safeAreaBottom = MediaQueryData.fromView(View.of(this)).padding.bottom;
    return safeAreaBottom == 0 ? 16: safeAreaBottom;
  }

  ///Removes focus from all nodes
  void unFocus() => FocusScope.of(this).requestFocus(FocusNode());
}

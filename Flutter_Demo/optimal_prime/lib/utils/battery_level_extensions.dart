import 'package:flutter/material.dart';

const int _fullBatteryLevel = 100;
const int _middleBatteryLevel = 60;
const int _lowBatteryLevel = 21;

extension BatteryLevelExtensions on int {
  double get calculateRightPadding => (_fullBatteryLevel - this).toDouble();

  BatteryLevelWidgetColors takeFrom(BuildContext context) {
    if (this <= _fullBatteryLevel && this >= _middleBatteryLevel) {
      return BatteryLevelWidgetColors(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        onBackgroundColor: Theme.of(context).colorScheme.primary,
      );
    } else if (this < _middleBatteryLevel && this >= _lowBatteryLevel) {
      return BatteryLevelWidgetColors(
        backgroundColor: Theme.of(context).colorScheme.onTertiary,
        onBackgroundColor: Theme.of(context).colorScheme.tertiary,
      );
    } else {
      return BatteryLevelWidgetColors(
        backgroundColor: Theme.of(context).colorScheme.errorContainer,
        onBackgroundColor: Theme.of(context).colorScheme.error,
      );
    }
  }
}

@immutable
class BatteryLevelWidgetColors {
  final Color backgroundColor;
  final Color onBackgroundColor;

  const BatteryLevelWidgetColors({
    required this.backgroundColor,
    required this.onBackgroundColor,
  });
}

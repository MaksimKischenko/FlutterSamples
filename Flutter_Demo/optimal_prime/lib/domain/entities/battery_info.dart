import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:optimal_prime/utils/mocked/mocked_battery.dart';

@immutable
class BatteryInfo {
  const BatteryInfo({
    required this.batteryLevel,
    required this.isInBatterySaveMode,
    required this.isBatteryWithLowLevel,
    required this.batteryState,
  });

  final int batteryLevel;
  final bool isInBatterySaveMode;
  final bool isBatteryWithLowLevel;
  final MockedBatteryState batteryState;
}

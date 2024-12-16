import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:optimal_prime/utils/mocked/mocked_battery.dart';

@immutable
class BatteryInfo {
  const BatteryInfo({
    required this.batteryLevel,
    required this.isInBatterySaveMode,
    required this.batteryState,
    this.androidBatteryCapacity,
    this.androidChargeTimeRemaining,
    this.androidCurrentAverage,
    this.androidCurrentNow,
    this.androidHealth,
    this.androidPluggedStatus,
    this.androidRemainingEnergy,
    this.androidScale,
    this.androidTechnology,
    this.androidTemperature,
  });

  final int batteryLevel;
  final bool isInBatterySaveMode;
  final MockedBatteryState batteryState;

  final int? androidBatteryCapacity;
  final int? androidChargeTimeRemaining;
  final int? androidCurrentAverage;
  final int? androidCurrentNow;
  final String? androidHealth;
  final String? androidPluggedStatus;
  final int? androidRemainingEnergy;
  final int? androidScale;
  final String? androidTechnology;
  final double? androidTemperature;

  factory BatteryInfo.fromIOS({
    required int batteryLevel,
    required bool isInBatterySaveMode,
    required MockedBatteryState batteryState,
  }) =>
      BatteryInfo(
        batteryLevel: batteryLevel,
        isInBatterySaveMode: isInBatterySaveMode,
        batteryState: batteryState,
      );

  factory BatteryInfo.fromAndroid({
    required int batteryLevel,
    required bool isInBatterySaveMode,
    required MockedBatteryState batteryState,
    int? batteryCapacity,
    int? chargeTimeRemaining,
    int? currentAverage,
    int? currentNow,
    String? health,
    String? pluggedStatus,
    int? remainingEnergy,
    int? scale,
    String? technology,
    double? temperature,
  }) =>
      BatteryInfo(
        batteryLevel: batteryLevel,
        isInBatterySaveMode: isInBatterySaveMode,
        batteryState: batteryState,
        androidBatteryCapacity: batteryCapacity,
        androidChargeTimeRemaining: chargeTimeRemaining,
        androidCurrentAverage: currentAverage,
        androidCurrentNow: currentNow,
        androidHealth: health,
        androidPluggedStatus: pluggedStatus,
        androidRemainingEnergy: remainingEnergy,
        androidScale: scale,
        androidTechnology: technology,
        androidTemperature: temperature,
      );
}

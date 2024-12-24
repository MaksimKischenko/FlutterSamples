import 'dart:math';

import 'package:flutter/material.dart';
import 'package:optimal_prime/domain/entities/battery_info.dart';
import 'package:optimal_prime/generated/translations.g.dart';
import 'package:optimal_prime/utils/build_context_extensions.dart';

class MockedBattery {
  final _random = Random();
  Future<int> get batteryLevel async => _random.nextInt(101);
  Future<bool> get isInBatterySaveMode async => _random.nextBool();
  Stream<MockedBatteryState> get onBatteryStateChanged async* {
    while (true) {
      yield MockedBatteryState.values[_random.nextInt(MockedBatteryState.values.length)];
      await Future.delayed(const Duration(seconds: 5));
    }
  }
}

enum MockedBatteryState {
  /// The battery is fully charged.
  full,

  /// The battery is currently charging.
  charging,

  /// Device is connected to external power source, but not charging the battery.
  ///
  /// Usually happens when device has charge limit enabled and this limit is reached.
  /// Also, battery might be in this state if connected power source isn't powerful enough to charge the battery.
  ///
  /// Available on Android, MacOS and Linux platforms only.
  connectedNotCharging,

  /// The battery is currently losing energy.
  discharging,

  /// The state of the battery is unknown.
  unknown;
}

extension BatteryInfoExtension on BatteryInfo {
  String batteryStateByName(BuildContext context) {
    switch (batteryState) {
      case MockedBatteryState.full:
        return context.t.mobileScreens.home.batteryInfo.chargingState.full;
      case MockedBatteryState.charging:
        return context.t.mobileScreens.home.batteryInfo.chargingState.charging;
      case MockedBatteryState.discharging:
        return context.t.mobileScreens.home.batteryInfo.chargingState.discharging;
      default:
        return context.t.mobileScreens.home.batteryInfo.chargingState.unknown;
    }
  }

  Color batteryStateByColor(BuildContext context) {
    switch (batteryState) {
      case MockedBatteryState.full:
      case MockedBatteryState.charging:
        return context.colors.primary;
      case MockedBatteryState.discharging:
        return context.colors.error;
      default:
        return context.colors.onSecondaryContainer;
    }
  }
}

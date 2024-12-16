import 'dart:math';

class MockedBattery {
  final _random = Random();
  Future<int> get batteryLevel async => _random.nextInt(101);
  Future<bool> get isInBatterySaveMode async => _random.nextBool();
  Stream<MockedBatteryState> get onBatteryStateChanged async* {
    while (true) {
      yield MockedBatteryState.values[_random.nextInt(MockedBatteryState.values.length)];
      await Future.delayed(const Duration(seconds: 30));
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

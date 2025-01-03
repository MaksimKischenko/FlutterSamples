import 'dart:async';

import 'package:battery_plus/battery_plus.dart';
import 'package:optimal_prime/domain/entities/battery_info.dart';
import 'package:optimal_prime/utils/logger/log.dart';
import 'package:optimal_prime/utils/mocked/mocked_battery.dart';
import 'package:rxdart/rxdart.dart';

class BatteryInfoService {
  BatteryInfoService({
    required Battery battery,
  }) : _battery = battery {
    _getBatteryInfo();
  }

  final Battery _battery;
  final MockedBattery _mockedBattery = MockedBattery();
  late final Stream<BatteryInfo?>? batteryInfoStream;
  final StreamController<int?> _batteryLevelController = StreamController<int?>.broadcast();
  final StreamController<bool> _batterySafeModeController = StreamController<bool>.broadcast();
  Timer? _timer;

  void _getBatteryInfo() {
    _batteryInfoHadler();
    batteryInfoStream = Rx.combineLatest3<MockedBatteryState, int?, bool, BatteryInfo?>(
      _mockedBattery.onBatteryStateChanged,
      _batteryLevelController.stream,
      _batterySafeModeController.stream,
      (batteryState, batteryLevel, batterySafeMode) => BatteryInfo(
        batteryState: batteryState,
        batteryLevel: batteryLevel ?? 0,
        isInBatterySaveMode: batterySafeMode,
        isBatteryWithLowLevel:
            ((batteryLevel ?? 0) <= 20) || batteryState == MockedBatteryState.charging,
      ),
    ).asBroadcastStream();
  }

  void dispose() {
    _batteryLevelController.close();
    _batterySafeModeController.close();
    _timer?.cancel();
  }

  Future<void> _batteryInfoHadler() async {
    _timer?.cancel();
    await _updayeBatteryInfo();
    Timer.periodic(const Duration(seconds: 10), (timer) async {
      try {
        await _updayeBatteryInfo();
      } catch (ex, st) {
        Log.logger.t(
          ex.toString(),
          stackTrace: st,
        );
      }
    });
  }

  Future<void> _updayeBatteryInfo() async {
    _batteryLevelController.add(await _mockedBattery.batteryLevel);
    _batterySafeModeController.add(await _mockedBattery.isInBatterySaveMode);
  }
}

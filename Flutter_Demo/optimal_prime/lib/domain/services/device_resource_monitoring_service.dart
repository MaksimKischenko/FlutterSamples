import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:optimal_prime/domain/entities/device_resource_monitoring_info.dart';
import 'package:optimal_prime/domain/services/target_platform_service.dart';
import 'package:rxdart/rxdart.dart';

class DeviceResourceMonitoringService with TargetPlatformService {
  DeviceResourceMonitoringService({
    required Connectivity connectivity,
    // required ScreenBrightness screenBrightness,
  }) : _connectivity = connectivity
  // _screenBrightness = screenBrightness {
  {
    _initialise();
  }

  final Connectivity _connectivity;
  // final ScreenBrightness _screenBrightness;
  late final Stream<List<ConnectivityResult>> _connectivityResult;
  late final Stream<DeviceResourceMonitoringInfo> resourceMonitoringStream;

  Future<void> _initialise() async {
    _connectivityResult = _connectivity.onConnectivityChanged;
    resourceMonitoringStream = Rx.combineLatest(
      [
        _connectivityResult,
      ],
      (connectivity) => DeviceResourceMonitoringInfo(
        brightness: 11,
        //brightness: screenBrightness,
        isMobileNetwork: connectivity.first.contains(ConnectivityResult.mobile),
        isWifiNetwork: connectivity.first.contains(ConnectivityResult.wifi),
        isBluetoothConnection: connectivity.first.contains(ConnectivityResult.bluetooth),
        isVpnConnection: isIOSplatform
            ? connectivity.first.contains(ConnectivityResult.other)
            : connectivity.first.contains(ConnectivityResult.vpn),
      ),
    );
  }

  //   Future<void> _initialise() async {
  //   _connectivityResult = _connectivity.onConnectivityChanged;
  //   resourceMonitoringStream = Rx.combineLatest2(
  //     _connectivityResult,
  //     _screenBrightness.onApplicationScreenBrightnessChanged,
  //     (connectivity, screenBrightness) => DeviceResourceMonitoringInfo(
  //       brightness: screenBrightness,
  //       isMobileNetwork: connectivity.contains(ConnectivityResult.mobile),
  //       isWifiNetwork: connectivity.contains(ConnectivityResult.wifi),
  //       isBluetoothConnection: connectivity.contains(ConnectivityResult.bluetooth),
  //       isVpnConnection: isIOSplatform
  //           ? connectivity.contains(ConnectivityResult.other)
  //           : connectivity.contains(ConnectivityResult.vpn),
  //     ),
  //   );
  // }
}

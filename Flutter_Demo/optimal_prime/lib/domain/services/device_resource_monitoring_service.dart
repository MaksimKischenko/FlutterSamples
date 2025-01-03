import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:optimal_prime/domain/entities/device_resource_monitoring_info.dart';
import 'package:optimal_prime/domain/services/target_platform_service.dart';
import 'package:rxdart/rxdart.dart';

class DeviceResourceMonitoringService with TargetPlatformService {
  DeviceResourceMonitoringService({
    required Connectivity connectivity,
  }) : _connectivity = connectivity;

  final Connectivity _connectivity;
  late final Stream<DeviceResourceMonitoringInfo> resourceMonitoringStream;

  Future<void> initialise() async {
    resourceMonitoringStream = Rx.combineLatest(
      [
        _connectivity.onConnectivityChanged,
      ],
      (connectivity) => DeviceResourceMonitoringInfo(
        isMobileNetwork: connectivity.first.contains(ConnectivityResult.mobile),
        isWifiNetwork: connectivity.first.contains(ConnectivityResult.wifi),
        isBluetoothConnection: connectivity.first.contains(ConnectivityResult.bluetooth),
        isVpnConnection: isIOSplatform
            ? connectivity.first.contains(ConnectivityResult.other)
            : connectivity.first.contains(ConnectivityResult.vpn),
      ),
    ).asBroadcastStream();
  }

  void dispose() {
    // resourceMonitoringStream.doOnCancel(() {});
  }
}

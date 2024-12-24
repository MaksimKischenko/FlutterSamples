import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:optimal_prime/domain/entities/connectivity_info.dart';
import 'package:optimal_prime/domain/services/target_platform_service.dart';
import 'package:rxdart/rxdart.dart';

class ConnectivityService with TargetPlatformService {
  ConnectivityService({
    required Connectivity connectivity,
  }) : _connectivity = connectivity {
    _initialise();
  }

  final Connectivity _connectivity;
  late final Stream<List<ConnectivityResult>> _connectivityResult;
  late final Stream<ConnectivityInfo> connectivityInfoStream;

  void _initialise() {
    _connectivityResult = _connectivity.onConnectivityChanged;
    connectivityInfoStream = Rx.combineLatest(
      [_connectivityResult],
      (result) => ConnectivityInfo(
        isMobileNetwork: result.single.contains(ConnectivityResult.mobile),
        isWifiNetwork: result.single.contains(ConnectivityResult.wifi),
        isBluetoothConnection: result.single.contains(ConnectivityResult.bluetooth),
        isVpnConnection: isIOSplatform
            ? result.single.contains(ConnectivityResult.other)
            : result.single.contains(ConnectivityResult.vpn),
      ),
    );
  }
}

import 'package:flutter/material.dart';

@immutable
class DeviceResourceMonitoringInfo {
  const DeviceResourceMonitoringInfo(
      {required this.isMobileNetwork,
      required this.isWifiNetwork,
      required this.isBluetoothConnection,
      required this.isVpnConnection,
      required this.brightness});

  final bool isMobileNetwork;
  final bool isWifiNetwork;
  final bool isBluetoothConnection;
  final bool isVpnConnection;
  final double brightness;
}

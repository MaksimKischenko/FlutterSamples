// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

@immutable
class ConnectivityInfo {
  const ConnectivityInfo({
    required this.isMobileNetwork,
    required this.isWifiNetwork,
    required this.isBluetoothConnection,
    required this.isVpnConnection,
  });

  final bool isMobileNetwork;
  final bool isWifiNetwork;
  final bool isBluetoothConnection;
  final bool isVpnConnection;

  @override
  String toString() =>
      'ConnectivityInfo(isMobileNetwork: $isMobileNetwork, isWifiNetwork: $isWifiNetwork, isBluetoothConnection: $isBluetoothConnection, isVpnConnection: $isVpnConnection)';
}

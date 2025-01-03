import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:optimal_prime/presentation/bloc/resource_monitoring/resource_monitoring_bloc.dart';
import 'package:optimal_prime/presentation/screens/home/widgets/card_info_animation.dart';
import 'package:optimal_prime/presentation/screens/home/widgets/card_info_title.dart';
import 'package:optimal_prime/presentation/screens/home/widgets/card_loading_body.dart';
import 'package:optimal_prime/utils/assets_provider.dart';
import 'package:optimal_prime/utils/sizes.dart';

class DeviceResourceMonitoringInfo extends StatelessWidget {
  const DeviceResourceMonitoringInfo({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<ResourceMonitoringBloc, ResourceMonitoringState>(
        builder: (context, state) {
          if (state is ResourceMonitoringLoading) {
            return const Padding(
              padding: EdgeInsets.all(KSize.margin4x),
              child: CardLoadingBody(),
            );
          }
          if (state is ResourceMonitoringUpdated) {
            final isBluetoothConnection = state.deviceResourceMonitoringInfo.isBluetoothConnection;
            final isVpnConnection = state.deviceResourceMonitoringInfo.isVpnConnection;
            final isWifiNetwork = state.deviceResourceMonitoringInfo.isWifiNetwork;
            final isMobileNetwork = state.deviceResourceMonitoringInfo.isMobileNetwork;
            final connections = [
              (
                isActive: isBluetoothConnection,
                lottieAsset: LottieAsset.bluetooth,
                name: 'Bluetooth'
              ),
              (
                isActive: isVpnConnection,
                lottieAsset: LottieAsset.vpn,
                name: 'VPN',
              ),
              (
                isActive: isWifiNetwork,
                lottieAsset: LottieAsset.wifi,
                name: 'WiFi',
              ),
              (
                isActive: isMobileNetwork,
                lottieAsset: LottieAsset.mobile,
                name: 'Mobile network',
              ),
            ];
            return Padding(
              padding: const EdgeInsets.all(KSize.margin4x),
              child: Column(
                children: connections
                    .map((connections) => Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CardInfoTitle(name: connections.name),
                            CardInfoAnimation(
                              isOn: connections.isActive,
                              animationOn: connections.lottieAsset,
                              animationOff: LottieAsset.off,
                            )
                          ],
                        ))
                    .toList(),
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      );
}

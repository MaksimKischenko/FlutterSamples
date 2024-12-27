import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:optimal_prime/presentation/bloc/resource_monitoring/resource_monitoring_bloc.dart';
import 'package:optimal_prime/presentation/screens/home/widgets/card_info_animation.dart';
import 'package:optimal_prime/presentation/screens/home/widgets/card_info_title.dart';
import 'package:optimal_prime/presentation/screens/home/widgets/card_loading_body.dart';
import 'package:optimal_prime/utils/assets_provider.dart';
import 'package:optimal_prime/utils/sizes.dart';

class ConnectivityInfo extends StatelessWidget {
  const ConnectivityInfo({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<ResourceMonitoringBloc, ResourceMonitoringState>(
        builder: (context, state) {
          if (state is ResourceMonitoringLoading) {
            return const CardLoadingBody();
          }
          if (state is ResourceMonitoringUpdated) {
            final isBluetoothConnection = state.connectivityInfo.isBluetoothConnection;
            final isVpnConnection = state.connectivityInfo.isVpnConnection;
            final isWifiNetwork = state.connectivityInfo.isWifiNetwork;
            final isMobileNetwork = state.connectivityInfo.isMobileNetwork;
            return Padding(
              padding: const EdgeInsets.all(KSize.margin4x),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CardInfoTitle(name: 'Bluetooth connection'),
                      CardInfoAnimation(
                        isAnimated: isBluetoothConnection,
                        animationName: LottieAsset.bluetooth,
                      )
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CardInfoTitle(name: 'VPN'),
                      CardInfoAnimation(
                        isAnimated: isVpnConnection,
                        animationName: LottieAsset.vpn,
                      )
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CardInfoTitle(name: 'WiFi'),
                      CardInfoAnimation(
                        isAnimated: isWifiNetwork,
                        animationName: LottieAsset.wifi,
                      )
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CardInfoTitle(name: 'Mobile network'),
                      CardInfoAnimation(
                        isAnimated: isMobileNetwork,
                        animationName: LottieAsset.mobile,
                      )
                    ],
                  ),
                ],
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      );
}

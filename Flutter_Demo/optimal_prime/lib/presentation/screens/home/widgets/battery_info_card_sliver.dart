import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:optimal_prime/generated/translations.g.dart';
import 'package:optimal_prime/presentation/bloc/battery_info/battery_info_bloc.dart';
import 'package:optimal_prime/presentation/screens/home/widgets/battery_level.dart';
import 'package:optimal_prime/presentation/screens/home/widgets/card_info_animation.dart';
import 'package:optimal_prime/presentation/screens/home/widgets/card_loading_body.dart';
import 'package:optimal_prime/utils/assets_provider.dart';
import 'package:optimal_prime/utils/build_context_extensions.dart';
import 'package:optimal_prime/utils/gaps.dart';
import 'package:optimal_prime/utils/mocked/mocked_battery.dart';
import 'package:optimal_prime/utils/sizes.dart';

import 'card_info_title.dart';

class BatteryInfoCardSliver extends StatelessWidget {
  const BatteryInfoCardSliver({super.key});

  @override
  Widget build(BuildContext context) => SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: KSize.margin2x),
        sliver: SliverToBoxAdapter(
          child: Card(
            // elevation: 0,
            color: context.colors.onPrimary,
            child: Padding(
              padding: const EdgeInsets.all(KSize.margin2x),
              child: BlocBuilder<BatteryInfoBloc, BatteryInfoState>(
                builder: (context, state) {
                  if (state is BatteryInfoLoading) {
                    return const CardLoadingBody();
                  }
                  if (state is BatteryInfoUpdated) {
                    final isSaveMode = state.batteryInfo?.isInBatterySaveMode ?? false;
                    final isBatteryWithLowLevel = state.batteryInfo?.isBatteryWithLowLevel ?? false;
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CardInfoTitle(
                                  name: context.t.mobileScreens.home.batteryInfo.levelTitle,
                                ),
                                Gap.verticalMaterialHalf,
                                BatteryLevelWidget(
                                  batteryLevel: state.batteryInfo?.batteryLevel ?? 0,
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                CardInfoTitle(
                                  name: context.t.mobileScreens.home.batteryInfo.saveMode,
                                ),
                                Gap.verticalMaterialHalf,
                                CardInfoAnimation(
                                  isAnimated: isSaveMode,
                                  animationName: LottieAsset.saveMode,
                                )
                              ],
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: KSize.margin2x),
                          child: Divider(
                            thickness: 0,
                            color: context.colors.onSurfaceVariant,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CardInfoTitle(
                                  name: context.t.mobileScreens.home.batteryInfo.chargingStateTitle,
                                ),
                                Gap.verticalMaterialHalf,
                                Text(
                                  state.batteryInfo?.batteryStateByName(context) ?? '',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: context.textTheme.bodyLarge?.copyWith(
                                    color: state.batteryInfo?.batteryStateByColor(context),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                CardInfoTitle(
                                  name: context.t.mobileScreens.home.batteryInfo.timeToChargeTitle,
                                ),
                                Gap.verticalMaterialHalf,
                                CardInfoAnimation(
                                  isAnimated: isBatteryWithLowLevel,
                                  animationName: LottieAsset.low,
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            ),
          ),
        ),
      );
}

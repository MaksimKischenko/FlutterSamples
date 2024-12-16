import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:optimal_prime/presentation/bloc/battery_info/battery_info_bloc.dart';
import 'package:optimal_prime/presentation/screens/home/widgets/battery_level.dart';
import 'package:optimal_prime/utils/build_context_extensions.dart';
import 'package:optimal_prime/utils/gaps.dart';
import 'package:optimal_prime/utils/sizes.dart';

class BatteryInfoCardSliver extends StatelessWidget {
  const BatteryInfoCardSliver({super.key});

  @override
  Widget build(BuildContext context) => SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: KSize.margin2x),
        sliver: SliverToBoxAdapter(
          child: Card(
            elevation: 0,
            color: context.colors.onPrimary,
            child: Padding(
              padding: const EdgeInsets.all(KSize.margin2x),
              child: BlocBuilder<BatteryInfoBloc, BatteryInfoState>(
                builder: (context, state) {
                  if (state is BatteryInfoUpdated) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Battery level',
                          style: context.textTheme.titleSmall,
                        ),
                        Gap.verticalMaterialHalf,
                        BatteryLevelWidget(
                          batteryLevel: state.batteryInfo?.batteryLevel ?? 0,
                        ),
                        Gap.verticalMaterialHalf,
                        Text(
                          'Battery state:${state.batteryInfo?.batteryState.name}',
                          style: context.textTheme.titleSmall,
                        ),
                        Text(
                          'SafeMode:${state.batteryInfo?.isInBatterySaveMode}',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: context.textTheme.bodyMedium,
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

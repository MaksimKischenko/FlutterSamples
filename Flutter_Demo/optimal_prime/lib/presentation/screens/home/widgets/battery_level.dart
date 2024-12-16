import 'package:flutter/material.dart';
import 'package:optimal_prime/utils/battery_level_extensions.dart';
import 'package:optimal_prime/utils/build_context_extensions.dart';
import 'package:optimal_prime/utils/sizes.dart';

class BatteryLevelWidget extends StatelessWidget {
  final int batteryLevel;
  const BatteryLevelWidget({
    Key? key,
    required this.batteryLevel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final decoration = BoxDecoration(
      borderRadius: KSize.defaultBorderRadius,
      color: batteryLevel.takeFrom(context).backgroundColor,
    );
    return Container(
      width: KSize.margin32x,
      height: KSize.margin10x,
      decoration: decoration,
      child: Padding(
        padding: EdgeInsets.only(
          bottom: KSize.marginThreeQuarters,
          top: KSize.marginThreeQuarters,
          left: KSize.marginThreeQuarters,
          right: KSize.marginThreeQuarters + batteryLevel.calculateRightPadding,
        ),
        child: Container(
          decoration: decoration.copyWith(
            color: batteryLevel.takeFrom(context).onBackgroundColor,
          ),
          child: Center(
            child: FittedBox(
              child: Text(
                '$batteryLevel%',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: context.textTheme.labelLarge?.copyWith(
                  color: context.colors.onPrimary,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:optimal_prime/generated/translations.g.dart';
import 'package:optimal_prime/utils/build_context_extensions.dart';
import 'package:optimal_prime/utils/sizes.dart';

class CardInfoAnimation extends StatelessWidget {
  final bool isAnimated;
  final String animationName;
  const CardInfoAnimation({
    super.key,
    required this.isAnimated,
    required this.animationName,
  });

  @override
  Widget build(BuildContext context) {
    if (isAnimated) {
      return Lottie.asset(
        animationName,
        width: KSize.avatarS,
        height: KSize.avatarS,
        fit: BoxFit.contain,
      );
    } else {
      return SizedBox(
        width: KSize.avatarS,
        height: KSize.avatarS,
        child: Text(
          context.t.mobileScreens.home.batteryInfo.saveModeOff,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: context.textTheme.titleMedium?.copyWith(
            color: context.colors.error,
          ),
        ),
      );
    }
  }
}

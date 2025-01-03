import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:optimal_prime/utils/sizes.dart';

class CardInfoAnimation extends StatelessWidget {
  final bool isOn;
  final String animationOn;
  final String animationOff;
  const CardInfoAnimation({
    super.key,
    required this.isOn,
    required this.animationOn,
    required this.animationOff,
  });

  @override
  Widget build(BuildContext context) {
    if (isOn) {
      return Lottie.asset(
        animationOn,
        width: KSize.avatarS,
        height: KSize.avatarS,
        fit: BoxFit.contain,
      );
    } else {
      return Lottie.asset(
        animationOff,
        width: KSize.avatarS,
        height: KSize.avatarS,
        fit: BoxFit.contain,
      );
    }
  }
}

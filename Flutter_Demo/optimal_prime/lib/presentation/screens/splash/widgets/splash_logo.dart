import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:optimal_prime/presentation/widgets/shimmer.dart';
import 'package:optimal_prime/utils/core_asset.dart';
import 'package:optimal_prime/utils/sizes.dart';

class SplashLogo extends StatelessWidget {
  const SplashLogo({
    super.key,
    this.isAnimated = false,
  });

  final bool isAnimated;

  LinearGradient get gradient => const LinearGradient(
        colors: [
          Colors.white60,
          Colors.white30,
          Colors.white60,
        ],
        stops: [
          0.0,
          0.1,
          1.0,
        ],
      );

  @override
  Widget build(BuildContext context) => AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutCubic,
        child: Shimmer(
          linearGradient: gradient,
          child: ShimmerLoading(
            isLoading: isAnimated,
            child: Center(
              child: SvgPicture.asset(
                CoreAsset.splash,
                width: KSize.avatar3XL,
                height: KSize.avatar3XL,
              ),
            ),
          ),
        ),
      );
}

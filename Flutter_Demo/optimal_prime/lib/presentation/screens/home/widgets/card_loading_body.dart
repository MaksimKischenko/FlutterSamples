import 'package:flutter/material.dart';
import 'package:optimal_prime/presentation/widgets/shimmer.dart';
import 'package:optimal_prime/utils/build_context_extensions.dart';
import 'package:optimal_prime/utils/sizes.dart';

class CardLoadingBody extends StatelessWidget {
  const CardLoadingBody({super.key});

  @override
  Widget build(BuildContext context) {
    final shimmerContainer = Container(
      height: KSize.avatarM,
      decoration: BoxDecoration(
        borderRadius: KSize.defaultBorderRadius,
        color: context.colors.onPrimary,
      ),
    );
    return Shimmer(
      child: ShimmerLoading(
        isLoading: true,
        child: Column(
          children: [
            shimmerContainer,
            Padding(
              padding: const EdgeInsets.symmetric(vertical: KSize.margin2x),
              child: Divider(
                thickness: 0,
                color: context.colors.onSurfaceVariant,
              ),
            ),
            shimmerContainer,
          ],
        ),
      ),
    );
  }
}

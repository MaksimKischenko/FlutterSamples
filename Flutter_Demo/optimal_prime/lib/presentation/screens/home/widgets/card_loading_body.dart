import 'package:flutter/material.dart';
import 'package:optimal_prime/presentation/screens/home/widgets/shimmer_container.dart';
import 'package:optimal_prime/presentation/widgets/shimmer.dart';
import 'package:optimal_prime/utils/build_context_extensions.dart';
import 'package:optimal_prime/utils/sizes.dart';

class CardLoadingBody extends StatelessWidget {
  const CardLoadingBody({super.key});

  @override
  Widget build(BuildContext context) => Shimmer(
        child: ShimmerLoading(
          isLoading: true,
          child: Column(
            children: [
              const ShimmerContainer(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: KSize.margin2x),
                child: Divider(
                  thickness: 1,
                  color: context.colors.onSurfaceVariant,
                ),
              ),
              const ShimmerContainer(),
            ],
          ),
        ),
      );
}

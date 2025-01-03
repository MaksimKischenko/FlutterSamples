import 'package:flutter/material.dart';
import 'package:optimal_prime/utils/build_context_extensions.dart';
import 'package:optimal_prime/utils/gaps.dart';
import 'package:optimal_prime/utils/sizes.dart';

class ShimmerContainer extends StatelessWidget {
  const ShimmerContainer({super.key});

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Container(
            height: KSize.avatarM,
            width: KSize.avatarM,
            decoration: BoxDecoration(
              borderRadius: KSize.defaultBorderRadius,
              color: context.colors.onPrimary,
            ),
          ),
          Gap.horizontalMaterial,
          Expanded(
              child: Column(
            children: [
              Container(
                height: KSize.avatar2S,
                decoration: BoxDecoration(
                  borderRadius: KSize.defaultBorderRadius,
                  color: context.colors.onPrimary,
                ),
              ),
              Gap.verticalMaterialHalf,
              Container(
                height: KSize.avatar2S,
                decoration: BoxDecoration(
                  borderRadius: KSize.defaultBorderRadius,
                  color: context.colors.onPrimary,
                ),
              ),
            ],
          )),
        ],
      );
}

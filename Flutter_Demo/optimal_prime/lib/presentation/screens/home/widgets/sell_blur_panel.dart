import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:optimal_prime/utils/build_context_extensions.dart';
import 'package:optimal_prime/utils/sizes.dart';

class BlurPanel extends StatelessWidget {
  const BlurPanel({
    required this.textString,
    required this.linearGradientColors,
    required this.onPressed,
    super.key,
  });

  final String textString;
  final List<Color> linearGradientColors;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    const blurFilterValue = 1.0;
    return ClipRect(
      child: BackdropFilter(
        blendMode: BlendMode.srcATop,
        filter: ImageFilter.blur(sigmaX: blurFilterValue),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: linearGradientColors,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(KSize.margin2x),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  textString,
                  style: context.textTheme.titleMedium?.apply(color: context.colors.onPrimary),
                  maxLines: 3,
                ),
                ElevatedButton(onPressed: onPressed, child: const Text('Run')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

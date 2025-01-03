import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:optimal_prime/utils/build_context_extensions.dart';
import 'package:optimal_prime/utils/sizes.dart';

class BlurPanel extends StatelessWidget {
  const BlurPanel({
    required this.child,
    super.key,
  });

  final Widget? child;

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
              colors: [
                context.colors.onTertiary.withOpacity(0.5),
                context.colors.tertiary.withOpacity(0.8),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(KSize.margin2x),
            child: child,
          ),
        ),
      ),
    );
  }
}

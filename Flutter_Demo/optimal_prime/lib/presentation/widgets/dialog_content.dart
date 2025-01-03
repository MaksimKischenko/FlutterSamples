import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:optimal_prime/utils/build_context_extensions.dart';
import 'package:optimal_prime/utils/gaps.dart';
import 'package:optimal_prime/utils/sizes.dart';
import 'package:optimal_prime/utils/theme.dart';

class DialogContent extends StatelessWidget {
  const DialogContent({
    Key? key,
    required this.title,
    required this.message,
    required this.animationName,
    required this.onPressed,
  }) : super(key: key);

  final String title;
  final String animationName;
  final String message;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    final availableWidth = MediaQuery.of(context).size.width;

    return AppCustomTheme(
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: KSize.avatarXL,
            height: KSize.margin1x,
            decoration: BoxDecoration(
              color: context.colors.tertiaryContainer,
              borderRadius: KSize.defaultBorderRadius,
            ),
          ),
          Gap.verticalMaterialHalf,
          Lottie.asset(
            width: KSize.avatarLHalf,
            height: KSize.avatarLHalf,
            animationName,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: KSize.margin4x),
            child: Text(
              key: ValueKey(title),
              title,
              textAlign: TextAlign.center,
              style: context.textTheme.titleMedium,
            ),
          ),
          Text(
            message,
            textAlign: TextAlign.center,
            style: context.textTheme.bodyMedium,
          ),
          const SizedBox(height: KSize.margin6x),
          SizedBox(
            width: availableWidth,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                  borderRadius: KSize.defaultBorderRadius,
                ),
              ),
              // color: context.colors.primaryContainer,
              // textColor: context.colors.onPrimaryContainer,
              onPressed: onPressed,
              child: const Text('OK'),
            ),
          ),
        ],
      ),
    );
  }
}

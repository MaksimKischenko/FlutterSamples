import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:optimal_prime/utils/build_context_extensions.dart';
import 'package:optimal_prime/utils/sizes.dart';
import 'package:optimal_prime/utils/theme.dart';

class DialogContent extends StatelessWidget {
  const DialogContent({
    Key? key,
    required this.title,
    required this.messages,
    required this.animationName,
    required this.isSecondButton,
    required this.onPressBtns,
    required this.textBtns,
  }) : super(key: key);

  final String title;
  final bool isSecondButton;
  final String animationName;
  final ({
    String investigateIssue,
    String callCustomer,
  }) messages;
  final ({String ok, String call}) textBtns;
  final ({
    VoidCallback onOkPressed,
    VoidCallback onCallPressed,
  }) onPressBtns;

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
              color: context.colors.primary,
              borderRadius: KSize.defaultBorderRadius,
            ),
          ),
          SizedBox(
            width: KSize.avatarXLHalf,
            height: KSize.avatarXLHalf,
            child: Lottie.asset(
              animationName,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            key: ValueKey(title),
            title,
            textAlign: TextAlign.center,
            style: context.textTheme.titleMedium,
          ),
          const SizedBox(height: KSize.margin2x),
          Text(
            'TEXT',
            textAlign: TextAlign.center,
            style: context.textTheme.bodyLarge,
          ),
          const SizedBox(height: KSize.margin6x),
          SizedBox(
            width: availableWidth,
            child: MaterialButton(
              color: context.colors.primaryContainer,
              textColor: context.colors.onPrimaryContainer,
              onPressed: onPressBtns.onOkPressed,
              child: const Text('OK'),
            ),
          ),
          if (isSecondButton) ...[
            const SizedBox(height: KSize.margin2Halfx),
            SizedBox(
              width: availableWidth,
              child: MaterialButton(
                color: context.colors.primaryContainer,
                textColor: context.colors.onPrimaryContainer,
                onPressed: onPressBtns.onCallPressed,
                child: const Text('OK'),
              ),
            ),
          ]
        ],
      ),
    );
  }
}

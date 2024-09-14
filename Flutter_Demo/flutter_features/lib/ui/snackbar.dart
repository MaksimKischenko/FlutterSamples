
import 'package:flutter/material.dart';
import 'package:flutter_features/extensions/build_context_extensions.dart';
import 'package:flutter_features/utils/durations.dart';
import 'package:flutter_features/utils/gaps.dart';
import 'package:flutter_features/utils/sizes.dart';

class CustomSnackbar {
  /// Shows a [message] using the [context] in a snackbar
  static void showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text(message),
        duration: KDuration.durationMedium,
      ),
    );
  }

  /// Returns a [SnackBar] with a [message] in its content
  static SnackBar getSnackBar(String message) {
    return SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Text(message),
      duration: KDuration.durationMedium,
    );
  }

  static void showNotImplemented(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text('Not implemented'),
        duration: KDuration.durationShort,
      ),
    );
  }

  static void showError(
    BuildContext context,
    String message, {
    IconData? icon = Icons.error_outline,
  }) {
    final textColor = context.colors.onErrorContainer;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        shape: const RoundedRectangleBorder(borderRadius: KSize.defaultBorderRadius),
        content: Row(
          children: [
            Icon(icon, color: textColor),
            Gap.horizontalMaterialHalf,
            Expanded(
              child: Text(
                message,
                style: context.textTheme.titleMedium?.copyWith(color: textColor),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        backgroundColor: context.colors.errorContainer,
      ),
    );
  }
}

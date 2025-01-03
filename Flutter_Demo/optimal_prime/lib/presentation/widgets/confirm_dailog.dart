import 'package:flutter/material.dart';
import 'package:optimal_prime/utils/build_context_extensions.dart';
import 'package:optimal_prime/utils/sizes.dart';
import 'package:optimal_prime/utils/theme.dart';

class ConfirmDialog extends StatelessWidget {
  const ConfirmDialog({
    required this.themeData,
    required this.title,
    this.description,
    required this.negativeButtonText,
    required this.onNegativeButtonTap,
    required this.positiveButtonText,
    required this.onPositiveButtonTap,
    super.key,
  });

  static Future<bool?> show(
    BuildContext parentContext, {
    bool barrierDismissible = true,
    ThemeData? themeData,
    required String title,
    String? description,
    required String negativeButtonText,
    ValueGetter<bool>? onNegativeButtonTap,
    required String positiveButtonText,
    ValueGetter<bool>? onPositiveButtonTap,
  }) =>
      showDialog<bool>(
        context: parentContext,
        barrierDismissible: barrierDismissible,
        builder: (context) => ConfirmDialog(
          themeData: themeData ?? AppTheme.light(context),
          title: title,
          description: description,
          negativeButtonText: negativeButtonText,
          onNegativeButtonTap: onNegativeButtonTap ?? () => true,
          positiveButtonText: positiveButtonText,
          onPositiveButtonTap: onPositiveButtonTap ?? () => true,
        ),
      );

  static Future<bool?> showConfirmLogoutDialog(
    BuildContext parentContext, {
    ThemeData? themeData,
  }) =>
      ConfirmDialog.show(
        parentContext,
        themeData: themeData,
        title: 'DESC',
        negativeButtonText: 'Cancel',
        positiveButtonText: 'OK',
        onPositiveButtonTap: () {
          // DtcEventBus.instance.fireEvent(const LogoutEvent());
          return true;
        },
      );

  final ThemeData themeData;
  final String title;
  final String? description;
  final String negativeButtonText;
  final ValueGetter<bool> onNegativeButtonTap;
  final String positiveButtonText;
  final ValueGetter<bool> onPositiveButtonTap;

  @override
  Widget build(BuildContext context) => AppCustomTheme(
        themeData: themeData,
        builder: (context) => Dialog(
          backgroundColor: context.colors.onPrimary,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(KSize.radiusLarge),
            ),
          ),
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: double.infinity,
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(KSize.margin5x),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      style: context.textTheme.titleMedium,
                      textAlign: TextAlign.center,
                    ),
                    if (description != null) ...[
                      const SizedBox(height: KSize.margin4x),
                      Text(
                        description!,
                        style: context.textTheme.bodyLarge,
                        textAlign: TextAlign.center,
                      ),
                    ],
                    const SizedBox(height: KSize.margin8x),
                    Row(
                      children: [
                        Expanded(
                          child: MaterialButton(
                            color: context.colors.primary,
                            key: const ValueKey('cancelCardDeletion'),
                            onPressed: () {
                              final result = onNegativeButtonTap();
                              if (result) {
                                Navigator.of(context).pop(false);
                              }
                            },
                          ),
                        ),
                        const SizedBox(width: KSize.margin4x),
                        Expanded(
                          child: MaterialButton(
                            color: context.colors.primary,
                            key: const ValueKey('deleteCard'),
                            onPressed: () {
                              final result = onPositiveButtonTap();
                              if (result) {
                                Navigator.of(context).pop(true);
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}


import 'package:flutter/material.dart';
import 'package:flutter_features/extensions/build_context_extensions.dart';
import 'package:flutter_features/ui/idt_rounded_button.dart';
import 'package:flutter_features/ui/theme.dart';
import 'package:flutter_features/utils/sizes.dart';

enum MTDialogButtonsDirection { vertical, horizontal }

class MTDialog extends StatelessWidget {
  const MTDialog({
    Key? key,
    required this.message,
    required this.onPressMainBtn,
    required this.textMainBtn,
    this.textSecondaryBtn = '',
    this.onPressSecondaryBtn,
    this.buttonAlignment = MTDialogButtonsDirection.horizontal,
    this.icon,
    this.primaryColor,
    this.iconColor,
    this.keyMainBtn,
    this.keySecondaryBtn,
    this.description,
    this.textAlign = TextAlign.center,
  }) : super(key: key);

  final String message;
  final String textMainBtn;
  final String textSecondaryBtn;
  final VoidCallback onPressMainBtn;
  final VoidCallback? onPressSecondaryBtn;
  final MTDialogButtonsDirection buttonAlignment;
  final IconData? icon;
  final Key? keyMainBtn;
  final Key? keySecondaryBtn;
  final Color? primaryColor;
  final Color? iconColor;
  final String? description;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return AlertDialog(
      surfaceTintColor: colors.onPrimary,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(KSize.radiusLarge),
        ),
      ),
      contentPadding: EdgeInsets.zero,
      content: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: KSize.platformBreakpoint),
        child: Padding(
          padding: const EdgeInsets.only(
            top: KSize.margin7x,
            left: KSize.margin4point5x,
            right: KSize.margin4point5x,
            bottom: KSize.margin6x,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: KSize.margin4x),
                  child: Center(
                    child: Icon(
                      icon,
                      size: KSize.avatarL,
                      color: iconColor ?? primaryColor,
                    ),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: KSize.margin4x),
                child: Semantics(
                  identifier: 'mtDialog',
                  child: Text(
                    message,
                    textAlign: textAlign,
                    style: TextStyle(
                      fontSize: KSize.fontSizeM,
                      fontWeight: KSize.fontWeightMediumBold,
                      color: colors.onBackground,
                      height: 25 / 20,
                    ),
                  ),
                ),
              ),
              if (description?.isNotEmpty ?? true)
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: KSize.margin4x,
                    vertical: KSize.margin2Halfx,
                  ),
                  child: Text(
                    key: const ValueKey('mtDialog'),
                    description!,
                    textAlign: textAlign,
                  ),
                ),
              const SizedBox(height: KSize.margin6x),
              if (buttonAlignment == MTDialogButtonsDirection.horizontal)
                horizontalButtons(context),
              if (buttonAlignment == MTDialogButtonsDirection.vertical) verticalButtons(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget horizontalButtons(BuildContext context) {
    return Row(
      children: [
        if (onPressSecondaryBtn != null) ...[
          Expanded(
            child: IdtRoundedButton(
              semanticsIdentifier: 'secondaryBtn',
              key: keySecondaryBtn,
              title: textSecondaryBtn,
              backgroundColor: context.colors.onPrimary,
              textColor: primaryColor ?? BaseMoneyColors.primary,
              onClick: onPressSecondaryBtn,
              borderColor: primaryColor ?? BaseMoneyColors.primary,
            ),
          ),
          const SizedBox(width: KSize.margin4point5x),
        ],
        Expanded(
          child: IdtRoundedButton(
            semanticsIdentifier: 'mainBtn',
            key: keyMainBtn,
            title: textMainBtn,
            backgroundColor: primaryColor ?? BaseMoneyColors.primary,
            textColor: context.colors.onPrimary,
            onClick: onPressMainBtn,
          ),
        ),
      ],
    );
  }

  Widget verticalButtons(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        IdtRoundedButton(
          semanticsIdentifier: 'mainBtn',
          key: keyMainBtn,
          title: textMainBtn,
          backgroundColor: primaryColor ?? BaseMoneyColors.primary,
          textColor: context.colors.onPrimary,
          onClick: onPressMainBtn,
        ),
        if (onPressSecondaryBtn != null) ...[
          const SizedBox(height: KSize.margin4point5x),
          IdtRoundedButton(
            semanticsIdentifier: 'secondaryBtn',
            key: keySecondaryBtn,
            title: textSecondaryBtn,
            backgroundColor: context.colors.onPrimary,
            textColor: primaryColor ?? BaseMoneyColors.primary,
            onClick: onPressSecondaryBtn,
            borderColor: primaryColor ?? BaseMoneyColors.primary,
          ),
        ],
      ],
    );
  }
}

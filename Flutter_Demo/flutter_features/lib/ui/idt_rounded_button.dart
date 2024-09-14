import 'package:flutter/material.dart';
import 'package:flutter_features/utils/sizes.dart';

class IdtRoundedButton extends StatelessWidget {
  const IdtRoundedButton({
    required this.title,
    required this.textColor,
    required this.backgroundColor,
    this.onClick,
    this.borderColor,
    this.height = KSize.buttonHeightM,
    this.semanticsIdentifier,
    super.key,
  });

  final String title;
  final Color textColor;
  final Color backgroundColor;
  final VoidCallback? onClick;
  final Color? borderColor;
  final double height;
  final String? semanticsIdentifier;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onClick,
      style: TextButton.styleFrom(
        fixedSize: Size.fromHeight(height),
        foregroundColor: textColor,
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          side: borderColor == null ? BorderSide.none : BorderSide(color: borderColor!, width: 2),
          borderRadius: const BorderRadius.all(
            Radius.circular(KSize.radiusDefaultMedium),
          ),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: KSize.margin1Halfx,
          horizontal: KSize.margin4x,
        ),
      ),
      child: Semantics(
        identifier: semanticsIdentifier,
        child: Text(
          key: ValueKey(title),
          title,
          textAlign: TextAlign.center,
          maxLines: 1,
          style: TextStyle(
            color: textColor,
            fontSize: KSize.fontSizeS,
            fontWeight: KSize.fontWeightMedium,
          ),
        ),
      ),
    );
  }
}

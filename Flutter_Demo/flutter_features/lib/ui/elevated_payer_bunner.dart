import 'package:flutter/material.dart';
import 'package:flutter_features/extensions/build_context_extensions.dart';
import 'package:flutter_features/ui/theme.dart';
import 'package:flutter_features/utils/sizes.dart';


class ElevatedPayerBanner extends StatelessWidget {

  const ElevatedPayerBanner({
    super.key,

  });

  static const _stops = <double>[
    0.26,
    0.74,
  ];

  @override
  Widget build(BuildContext context) {

    final theme = context.theme;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(BaseMoneyTheme.radiusDefault),
        gradient: LinearGradient(
          colors: [
            BaseMoneyColors.orange.withOpacity(0.7),
            BaseMoneyColors.orange.withOpacity(0.84),
          ],
          stops: _stops,
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
        ),
      ),
      child: Padding(
        padding:
            const EdgeInsets.symmetric(vertical: KSize.margin1x, horizontal: KSize.margin3Halfx,),
        child: Text(
          '',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: theme.textTheme.bodyMedium?.copyWith(
            shadows: [
              Shadow(
                offset: const Offset(1, 1),
                blurRadius: 0,
                color: BaseMoneyColors.surfaceTint.withOpacity(0.2),
              ),
            ],
            color: context.colors.onPrimary,
          ),
        ),
      ),
    );
  }
}

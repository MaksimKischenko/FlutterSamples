import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:optimal_prime/utils/build_context_extensions.dart';
import 'package:optimal_prime/utils/sizes.dart';

class PageViewItem extends StatelessWidget {
  final String itemImage;
  final String itemTitle;
  final String itemDesctiption;

  const PageViewItem({
    Key? key,
    required this.itemImage,
    required this.itemTitle,
    required this.itemDesctiption,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: KSize.margin4x),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              itemImage,
              width: KSize.calendarGridHeight,
              height: KSize.calendarGridHeight,
              fit: BoxFit.contain,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: KSize.margin2x,
              ),
              child: Text(
                itemTitle,
                style: context.textTheme.titleMedium,
              ),
            ),
            Text(
              itemDesctiption,
              textAlign: TextAlign.center,
              style: context.textTheme.bodyLarge?.copyWith(
                color: context.colors.onSurfaceVariant,
              ),
            )
          ],
        ),
      );
}

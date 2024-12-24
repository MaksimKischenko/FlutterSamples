import 'package:flutter/material.dart';
import 'package:optimal_prime/presentation/screens/home/widgets/sell_blur_panel.dart';
import 'package:optimal_prime/presentation/widgets/bottom_sheet.dart';
import 'package:optimal_prime/utils/assets_provider.dart';
import 'package:optimal_prime/utils/build_context_extensions.dart';
import 'package:optimal_prime/utils/sizes.dart';

class BatteryTaskCardSliver extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const additionalWidgetHeight = 90.0;

    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: KSize.margin2x),
      sliver: SliverToBoxAdapter(
        child: Card(
          child: ClipRRect(
            borderRadius: KSize.defaultBorderRadius,
            child: Stack(
              children: [
                Image.asset(
                  ImageAsset.manager,
                  height: KSize.calendarGridHeight,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: BlurPanel(
                    onPressed: () {
                      _onRunBatteryTaskManager(context);
                    },
                    textString: "Lest's run task manager",
                    linearGradientColors: [
                      context.colors.onTertiary.withOpacity(0.5),
                      context.colors.tertiary.withOpacity(0.8),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _onRunBatteryTaskManager(BuildContext context) async {
    await showModalBottomSheet<void>(
      isScrollControlled: true,
      shape: KSize.bottomSheetShape,
      context: context,
      builder: (bottomSheetContext) => AppBottomSheet.shrinkContent(
        builder: (context) => Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(KSize.margin3x),
              child: Text(
                'Ar you ready to run the battery task manager?',
                style: context.textTheme.headlineSmall,
              ),
            ),
            const SizedBox(height: KSize.margin2x),
            Padding(
              padding: const EdgeInsets.all(KSize.margin2x),
              child: Text(
                'This is a battery task manager. You can run it to optimize your battery life.',
                style: context.textTheme.labelMedium,
              ),
            ),
            const SizedBox(height: KSize.margin2x),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Run'),
            ),
          ],
        ),
      ),
    );
  }
}

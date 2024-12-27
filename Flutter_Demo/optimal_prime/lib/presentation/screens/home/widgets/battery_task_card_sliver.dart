import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:optimal_prime/presentation/screens/home/widgets/sell_blur_panel.dart';
import 'package:optimal_prime/presentation/widgets/bottom_sheet.dart';
import 'package:optimal_prime/presentation/widgets/dialog_content.dart';
import 'package:optimal_prime/presentation/widgets/dissmissible_dialog.dart';
import 'package:optimal_prime/utils/assets_provider.dart';
import 'package:optimal_prime/utils/build_context_extensions.dart';
import 'package:optimal_prime/utils/sizes.dart';

class BatteryTaskCardSliver extends StatelessWidget {
  @override
  Widget build(BuildContext context) => SliverPadding(
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
            Lottie.asset(
              LottieAsset.task,
              width: KSize.avatar4XL,
              height: KSize.avatar4XL,
              fit: BoxFit.contain,
            ),
            Padding(
              padding: const EdgeInsets.all(KSize.margin2x),
              child: Text(
                'This is a battery task manager. You can run it to optimize your battery life.',
                style: context.textTheme.labelMedium,
              ),
            ),
            const SizedBox(height: KSize.margin2x),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: KSize.margin2x),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    _info(context);
                  },
                  style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                    borderRadius: KSize.defaultBorderRadius,
                  )),
                  child: const Text('Start'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _info(BuildContext context) {
    showDismissibleDialog(
      context: context,
      onDismissed: (dialogContext) => Navigator.of(dialogContext).pop(),
      dialogContent: (innerContext) => DialogContent(
        title: 'You statrted the battery task manager!!',
        message: 'success',
        animationName: LottieAsset.ok,
        isSecondButton: false,
        onPressBtns: (
          onOkPressed: () {},
          onCallPressed: () {},
        ),
        textBtns: (
          ok: 'OK',
          call: 'NO',
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:optimal_prime/domain/entities/isar/battery_task.dart';
import 'package:optimal_prime/presentation/bloc/battery_task/battery_task_bloc.dart';
import 'package:optimal_prime/presentation/screens/home/widgets/current_task_dialog_widget.dart';
import 'package:optimal_prime/presentation/screens/home/widgets/sell_blur_panel.dart';
import 'package:optimal_prime/presentation/widgets/confirm_dailog.dart';
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
          child: BlocConsumer<BatteryTaskBloc, BatteryTaskState>(listener: (context, state) async {
            if (state is BatteryTaskFinished) {
              await ConfirmDialog.show(
                context,
                title: state.type.getUrlLinks(),
                negativeButtonText: 'NEGATIVE',
                positiveButtonText: 'POSITIVE',
              );
              context.read<BatteryTaskBloc>().add(BatteryTaskRefresh());
            } else if (state is BatteryTaskInited) {
              _info(context);
            }
          }, builder: (context, state) {
            if (state is BatteryTaskInitial) {
              final isEnabledCurrentTask = state.currentTask?.state?.isEnabled ?? false;
              return Card(
                child: ClipRRect(
                  borderRadius: KSize.defaultBorderRadius,
                  child: Stack(
                    children: [
                      Image.asset(
                        ImageAsset.managerInitial,
                        height: KSize.calendarGridHeight,
                        width: double.infinity,
                        fit: BoxFit.fill,
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: BlurPanel(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Center(
                                  child: Text(
                                    'New task is available. Lest start it!',
                                    style: context.textTheme.titleMedium
                                        ?.apply(color: context.colors.onPrimary),
                                    maxLines: 3,
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  _onRunBatteryTaskManager(context, state.currentTask);
                                },
                                child: const Text('Run'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
            if (state is BatteryTaskInited) {
              return Card(
                child: ClipRRect(
                  borderRadius: KSize.defaultBorderRadius,
                  child: Stack(
                    children: [
                      Image.asset(
                        ImageAsset.managerInited,
                        height: KSize.calendarGridHeight,
                        width: double.infinity,
                        fit: BoxFit.fill,
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: BlurPanel(
                            child: Center(
                              child: Lottie.asset(
                                LottieAsset.progress2,
                                width: KSize.avatar4XL,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return const SizedBox.shrink();
            }
          }),
        ),
      );

  Future<void> _onRunBatteryTaskManager(
    BuildContext context,
    BatteryTask? batteryTask,
  ) async {
    await showModalBottomSheet<void>(
      isScrollControlled: true,
      shape: KSize.bottomSheetShape,
      context: context,
      builder: (bottomSheetContext) => CurrentTaskDialogWidget(
        batteryTask: batteryTask,
      ),
    );
  }

  void _info(BuildContext context) {
    showDismissibleDialog(
      context: context,
      onDismissed: (dialogContext) => Navigator.of(dialogContext).pop(),
      dialogContent: (innerContext) => DialogContent(
        title: 'Task started',
        message: 'success',
        animationName: LottieAsset.start,
        onPressed: () => Navigator.of(innerContext).pop(),
      ),
    );
  }
}

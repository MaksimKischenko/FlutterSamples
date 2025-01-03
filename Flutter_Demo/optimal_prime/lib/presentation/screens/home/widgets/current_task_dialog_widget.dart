import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:optimal_prime/domain/entities/isar/battery_task.dart';
import 'package:optimal_prime/presentation/bloc/battery_task/battery_task_bloc.dart';
import 'package:optimal_prime/presentation/widgets/bottom_sheet.dart';
import 'package:optimal_prime/utils/assets_provider.dart';
import 'package:optimal_prime/utils/build_context_extensions.dart';
import 'package:optimal_prime/utils/sizes.dart';

class CurrentTaskDialogWidget extends StatelessWidget {
  final BatteryTask? batteryTask;
  const CurrentTaskDialogWidget({
    Key? key,
    required this.batteryTask,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => AppBottomSheet.shrinkContent(
        builder: (context) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: KSize.margin4x),
          child: Column(
            children: [
              Text(
                batteryTask?.type.getName(context) ?? '',
                style: context.textTheme.headlineMedium,
              ),
              Lottie.asset(
                LottieAsset.task,
                width: KSize.avatar4XL,
                height: KSize.avatar4XL,
                fit: BoxFit.contain,
              ),
              Text(
                batteryTask?.type.getTitle(context) ?? '',
                style: context.textTheme.displayMedium,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: KSize.margin4x),
                child: Text(
                  batteryTask?.type.getDescription(context) ?? '',
                  style: context.textTheme.labelLarge,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    context.read<BatteryTaskBloc>().add(BatteryTaskInit(currentTask: batteryTask));
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                      borderRadius: KSize.defaultBorderRadius,
                    ),
                  ),
                  child: const Text('Start'),
                ),
              ),
            ],
          ),
        ),
      );
}

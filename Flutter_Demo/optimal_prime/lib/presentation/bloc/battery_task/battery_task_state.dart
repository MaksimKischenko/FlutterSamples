part of 'battery_task_bloc.dart';

sealed class BatteryTaskState extends Equatable {
  const BatteryTaskState();

  @override
  List<Object?> get props => [];
}

final class BatteryTaskloading extends BatteryTaskState {}

final class BatteryTaskInitial extends BatteryTaskState {
  final BatteryTask? currentTask;

  const BatteryTaskInitial({
    required this.currentTask,
  });

  @override
  List<Object?> get props => [currentTask];
}

final class BatteryTaskInited extends BatteryTaskState {}

final class BatteryTaskFinished extends BatteryTaskState {
  final BatteryTaskType type;

  const BatteryTaskFinished({
    required this.type,
  });

  @override
  List<Object?> get props => [type];
}

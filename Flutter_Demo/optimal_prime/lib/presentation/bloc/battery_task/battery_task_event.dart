part of 'battery_task_bloc.dart';

sealed class BatteryTaskEvent extends Equatable {
  const BatteryTaskEvent();

  @override
  List<Object?> get props => [];
}

final class BatteryTaskInit extends BatteryTaskEvent {
  final BatteryTask? currentTask;

  const BatteryTaskInit({
    required this.currentTask,
  });

  @override
  List<Object?> get props => [currentTask];
}

final class BatteryTaskListen extends BatteryTaskEvent {}

final class BatteryTaskRefresh extends BatteryTaskEvent {}

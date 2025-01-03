import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:optimal_prime/domain/entities/isar/battery_task.dart';
import 'package:optimal_prime/domain/services/battery_task_service.dart';

part 'battery_task_event.dart';
part 'battery_task_state.dart';

class BatteryTaskBloc extends Bloc<BatteryTaskEvent, BatteryTaskState> {
  BatteryTaskBloc({
    required BatteryTaskService batteryTaskService,
  })  : _batteryTaskService = batteryTaskService,
        super(BatteryTaskloading()) {
    on<BatteryTaskEvent>(_onEvent);
  }

  final BatteryTaskService _batteryTaskService;

  Future<void>? _onEvent(
    BatteryTaskEvent event,
    Emitter<BatteryTaskState> emit,
  ) {
    if (event is BatteryTaskInit) return _onBatteryTaskInit(event, emit);
    if (event is BatteryTaskListen) return _onBatteryTaskListen(event, emit);
    if (event is BatteryTaskRefresh) return _onBatteryTaskRefresh(event, emit);
    return null;
  }

  Future<void> _onBatteryTaskInit(
    BatteryTaskInit event,
    Emitter<BatteryTaskState> emit,
  ) async {
    emit(BatteryTaskloading());
    await _batteryTaskService.initCurrentTask(event.currentTask);
    await _listenForInitedTask(emit);
  }

  Future<void> _onBatteryTaskListen(
    BatteryTaskListen event,
    Emitter<BatteryTaskState> emit,
  ) async {
    final currentTask = await _batteryTaskService.firstAvailableTask();
    if (currentTask?.state?.isEnabled ?? false) {
      await _listenForInitedTask(emit);
    } else {
      emit(BatteryTaskInitial(currentTask: currentTask));
    }
  }

  Future<void> _listenForInitedTask(Emitter<BatteryTaskState> emit) async {
    await _batteryTaskService.startListenForCurrentTask();
    emit(BatteryTaskInited());
    await emit.forEach<BatteryTaskType>(
      _batteryTaskService.batteryTaskTypeStream,
      onData: (data) => BatteryTaskFinished(type: data),
    );
  }

  Future<void> _onBatteryTaskRefresh(
    BatteryTaskRefresh event,
    Emitter<BatteryTaskState> emit,
  ) async {
    emit(BatteryTaskloading());
    final currentTask = await _batteryTaskService.firstAvailableTask();
    emit(BatteryTaskInitial(currentTask: currentTask));
  }

  @override
  Future<void> close() {
    _batteryTaskService.dispose();
    return super.close();
  }
}

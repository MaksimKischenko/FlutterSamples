import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:optimal_prime/domain/entities/battery_info.dart';
import 'package:optimal_prime/domain/services/battery_info_service.dart';

part 'battery_info_event.dart';
part 'battery_info_state.dart';

class BatteryInfoBloc extends Bloc<BatteryInfoEvent, BatteryInfoState> {
  BatteryInfoBloc({required BatteryInfoService batteryInfoService})
      : _batteryInfoService = batteryInfoService,
        super(BatteryInfoInitial()) {
    on<BatteryInfoEvent>(_onEvent);
  }

  final BatteryInfoService _batteryInfoService;

  Future<void>? _onEvent(
    BatteryInfoEvent event,
    Emitter<BatteryInfoState> emit,
  ) {
    if (event is BatteryInfoInit) return _onBatteryInfoInit(event, emit);
    if (event is BatteryInfoListen) return _onBatteryInfoListen(event, emit);
    return null;
  }

  Future<void> _onBatteryInfoInit(
    BatteryInfoInit event,
    Emitter<BatteryInfoState> emit,
  ) async {}

  Future<void> _onBatteryInfoListen(
    BatteryInfoListen event,
    Emitter<BatteryInfoState> emit,
  ) async {
    await emit.forEach<BatteryInfo?>(
      _batteryInfoService.batteryInfoStream!,
      onData: (data) => BatteryInfoUpdated(batteryInfo: data),
    );
  }

  @override
  Future<void> close() {
    _batteryInfoService.dispose();
    return super.close();
  }
}

part of 'battery_info_bloc.dart';

sealed class BatteryInfoEvent extends Equatable {
  const BatteryInfoEvent();

  @override
  List<Object> get props => [];
}

final class BatteryInfoInit extends BatteryInfoEvent {}

final class BatteryInfoListen extends BatteryInfoEvent {}

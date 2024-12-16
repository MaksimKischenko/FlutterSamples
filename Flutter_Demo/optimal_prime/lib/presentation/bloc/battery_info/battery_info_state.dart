part of 'battery_info_bloc.dart';

sealed class BatteryInfoState extends Equatable {
  const BatteryInfoState();

  @override
  List<Object?> get props => [];
}

final class BatteryInfoInitial extends BatteryInfoState {}

final class BatteryInfoLoading extends BatteryInfoState {}

final class BatteryInfoUpdated extends BatteryInfoState {
  final BatteryInfo? batteryInfo;

  const BatteryInfoUpdated({
    required this.batteryInfo,
  });

  @override
  List<Object?> get props => [batteryInfo];
}

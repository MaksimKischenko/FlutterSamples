part of 'resource_monitoring_bloc.dart';

sealed class ResourceMonitoringState extends Equatable {
  const ResourceMonitoringState();

  @override
  List<Object> get props => [];
}

final class ResourceMonitoringLoading extends ResourceMonitoringState {}

final class ResourceMonitoringUpdated extends ResourceMonitoringState {
  final DeviceResourceMonitoringInfo deviceResourceMonitoringInfo;

  const ResourceMonitoringUpdated({
    required this.deviceResourceMonitoringInfo,
  });

  @override
  List<Object> get props => [deviceResourceMonitoringInfo];
}

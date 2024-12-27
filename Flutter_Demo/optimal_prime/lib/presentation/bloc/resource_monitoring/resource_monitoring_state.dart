part of 'resource_monitoring_bloc.dart';

sealed class ResourceMonitoringState extends Equatable {
  const ResourceMonitoringState();

  @override
  List<Object> get props => [];
}

final class ResourceMonitoringLoading extends ResourceMonitoringState {}

final class ResourceMonitoringUpdated extends ResourceMonitoringState {
  final DeviceResourceMonitoringInfo connectivityInfo;

  const ResourceMonitoringUpdated({
    required this.connectivityInfo,
  });

  @override
  List<Object> get props => [connectivityInfo];
}

part of 'resource_monitoring_bloc.dart';

sealed class ResourceMonitoringEvent extends Equatable {
  const ResourceMonitoringEvent();

  @override
  List<Object> get props => [];
}

final class ResourceMonitoringListen extends ResourceMonitoringEvent {}

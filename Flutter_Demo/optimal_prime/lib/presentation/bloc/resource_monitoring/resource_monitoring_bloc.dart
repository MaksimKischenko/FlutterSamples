import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:optimal_prime/domain/entities/device_resource_monitoring_info.dart';
import 'package:optimal_prime/domain/services/device_resource_monitoring_service.dart';

part 'resource_monitoring_event.dart';
part 'resource_monitoring_state.dart';

class ResourceMonitoringBloc extends Bloc<ResourceMonitoringEvent, ResourceMonitoringState> {
  ResourceMonitoringBloc({required DeviceResourceMonitoringService resourceMonitoringService})
      : _resourceMonitoringService = resourceMonitoringService,
        super(ResourceMonitoringLoading()) {
    on<ResourceMonitoringEvent>(_onEvent);
  }

  final DeviceResourceMonitoringService _resourceMonitoringService;
  Future<void>? _onEvent(
    ResourceMonitoringEvent event,
    Emitter<ResourceMonitoringState> emit,
  ) {
    if (event is ResourceMonitoringListen) return _onListen(event, emit);
    return null;
  }

  Future<void> _onListen(
    ResourceMonitoringListen event,
    Emitter<ResourceMonitoringState> emit,
  ) async {
    await _resourceMonitoringService.initialise();
    await emit.forEach<DeviceResourceMonitoringInfo>(
      _resourceMonitoringService.resourceMonitoringStream,
      onData: (data) => ResourceMonitoringUpdated(deviceResourceMonitoringInfo: data),
    );
  }

  @override
  Future<void> close() {
    _resourceMonitoringService.dispose();
    return super.close();
  }
}

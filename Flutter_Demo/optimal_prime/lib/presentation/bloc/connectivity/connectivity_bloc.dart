import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:optimal_prime/domain/entities/connectivity_info.dart';
import 'package:optimal_prime/domain/services/connectivity_service.dart';

part 'connectivity_event.dart';
part 'connectivity_state.dart';

class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
  ConnectivityBloc({required ConnectivityService connectivityService})
      : _connectivityService = connectivityService,
        super(ConnectivityLoading()) {
    on<ConnectivityEvent>(_onEvent);
  }

  final ConnectivityService _connectivityService;
  Future<void>? _onEvent(
    ConnectivityEvent event,
    Emitter<ConnectivityState> emit,
  ) {
    if (event is ConnectivityListen) return _onConnetivityListen(event, emit);
    return null;
  }

  Future<void> _onConnetivityListen(
    ConnectivityListen event,
    Emitter<ConnectivityState> emit,
  ) async {
    await emit.forEach<ConnectivityInfo>(
      _connectivityService.connectivityInfoStream,
      onData: (data) => ConnectivityUpdated(connectivityInfo: data),
    );
  }
}

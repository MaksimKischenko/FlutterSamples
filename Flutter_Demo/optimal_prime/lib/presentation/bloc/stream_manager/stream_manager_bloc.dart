import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'stream_manager_event.dart';
part 'stream_manager_state.dart';

class StreamManagerBloc extends Bloc<StreamManagerEvent, StreamManagerState> {
  StreamManagerBloc() : super(StreamManagerInitial()) {
    on<StreamManagerEvent>(_onEvent);
  }

  Future<void>? _onEvent(
    StreamManagerEvent event,
    Emitter<StreamManagerState> emit,
  ) {
    if (event is FireEvent) return _onFireEvent(event, emit);
    return null;
  }

  Future<void> _onFireEvent<EventType>(
    FireEvent event,
    Emitter<StreamManagerState> emit,
  ) async {
    emit(StreamManagerRecieved<EventType>(recievedEvent: event.type));
  }
}

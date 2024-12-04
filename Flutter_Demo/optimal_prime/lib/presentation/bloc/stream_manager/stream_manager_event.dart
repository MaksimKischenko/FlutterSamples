part of 'stream_manager_bloc.dart';

sealed class StreamManagerEvent extends Equatable {
  const StreamManagerEvent();

  @override
  List<Object> get props => [];
}

final class FireEvent<EventType> extends StreamManagerEvent {
  final EventType type;

  const FireEvent({
    required this.type,
  });
}

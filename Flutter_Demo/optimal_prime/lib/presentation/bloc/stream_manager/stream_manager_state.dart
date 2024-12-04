part of 'stream_manager_bloc.dart';

sealed class StreamManagerState<EventType> extends Equatable {
  const StreamManagerState();

  @override
  List<EventType> get props => [];
}

final class StreamManagerInitial extends StreamManagerState {}

final class StreamManagerRecieved<EventType> extends StreamManagerState {
  final EventType recievedEvent;

  const StreamManagerRecieved({
    required this.recievedEvent,
  });

  @override
  List<EventType> get props => [recievedEvent];
}

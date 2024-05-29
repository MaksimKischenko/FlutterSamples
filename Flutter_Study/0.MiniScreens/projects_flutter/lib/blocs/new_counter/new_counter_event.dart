part of 'new_counter_bloc.dart';

abstract class NewCounterEvent extends Equatable {
  const NewCounterEvent();

  @override
  List<Object> get props => [];
}

class NewCounterIncrement extends NewCounterEvent {
  final int weight;

  NewCounterIncrement({required this.weight});

  @override
  List<Object> get props => [weight];
}

class NewCounterDecrement extends NewCounterEvent {
  final int weight;

  NewCounterDecrement({required this.weight});

  @override
  List<Object> get props => [weight];
}

part of 'new_counter_bloc.dart';

abstract class NewCounterState extends Equatable {
  const NewCounterState();

  @override
  List<Object> get props => [];
}

class NewCounterInitial extends NewCounterState {
  final int value;

  NewCounterInitial(this.value);

  @override
  List<Object> get props => [value];
}

class NewCounterLoading extends NewCounterState {}

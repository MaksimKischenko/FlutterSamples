import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'new_counter_event.dart';
part 'new_counter_state.dart';

class NewCounterBloc extends Bloc<NewCounterEvent, NewCounterState> {
  NewCounterBloc() : super(NewCounterInitial(0));

  @override
  Stream<NewCounterState> mapEventToState(
    NewCounterEvent event,
  ) async* {
    if (event is NewCounterIncrement) {
      yield* _mapNewCounterIncrementToState(
          event); //передавать функцию которая передает Stream
    } else if (event is NewCounterDecrement) {
      yield* _mapNewCounterDecrementToState(event);
    }
  }

  Stream<NewCounterState> _mapNewCounterIncrementToState(
      NewCounterIncrement event) async* {
    final currentState = state as NewCounterInitial;
    yield NewCounterInitial(currentState.value + event.weight);
  }

  Stream<NewCounterState> _mapNewCounterDecrementToState(
      NewCounterDecrement event) async* {
    final currentState = state as NewCounterInitial;
    yield NewCounterLoading();
    await Future.delayed(Duration(seconds: 3));
    yield NewCounterInitial(currentState.value - event.weight);
  }
}

part of 'counter_cubit.dart';

@freezed
class CounterState with _$CounterState {
  const factory CounterState.initial({required int initialCount}) = _Initial;
  const factory CounterState.loading() = _Loading;
  const factory CounterState.succes() = _Succes;
}

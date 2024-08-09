
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@Freezed(map: FreezedMapOptions.none, when: FreezedWhenOptions.none)
class HomeViewModelState with _$HomeViewModelState {
  const HomeViewModelState._();

  const factory HomeViewModelState({
    required bool isFirstLoad,
    required List<String> args,

  }) = _HomeViewModelState;
}

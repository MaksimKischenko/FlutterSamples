import 'package:cubit_view/bloc/cubit/counter_cubit.dart';
import 'package:cubit_view/utils/mountable_change_notifier.dart';
import 'package:flutter/material.dart';

class CounterViewModel extends ValueNotifier<CounterState> with Mountable {
  CounterViewModel(super.value);

}
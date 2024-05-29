import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'taxi_confirm_event.dart';
part 'taxi_confirm_state.dart';

class TaxiConfirmBloc extends Bloc<TaxiConfirmEvent, TaxiConfirmState> {
  TaxiConfirmBloc() : super(TaxiConfirmInitial());

  @override
  Stream<TaxiConfirmState> mapEventToState(
    TaxiConfirmEvent event,
  ) async* {
    if (event is TaxiSmsNotConfirm) {
      yield* _mapTaxiSmsNotConfirmToState(event);
    } else if (event is TaxiSmsConfirm) {
      yield* _mapTaxiSmsConfirmToState(event);
    }
  }

  Stream<TaxiConfirmState> _mapTaxiSmsNotConfirmToState(
      TaxiSmsNotConfirm event) async* {
    yield TaxiConfirmInitial();
  }

  Stream<TaxiConfirmState> _mapTaxiSmsConfirmToState(
      TaxiSmsConfirm event) async* {
    yield TaxiConfirmed();
  }
}

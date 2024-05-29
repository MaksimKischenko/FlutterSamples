part of 'taxi_confirm_bloc.dart';

abstract class TaxiConfirmEvent extends Equatable {
  const TaxiConfirmEvent();

  @override
  List<Object> get props => [];
}

class TaxiSmsNotConfirm extends TaxiConfirmEvent {}

class TaxiSmsConfirm extends TaxiConfirmEvent {}

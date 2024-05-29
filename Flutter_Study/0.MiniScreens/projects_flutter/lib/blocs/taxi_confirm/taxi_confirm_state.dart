part of 'taxi_confirm_bloc.dart';

abstract class TaxiConfirmState extends Equatable {
  const TaxiConfirmState();

  @override
  List<Object> get props => [];
}

class TaxiConfirmInitial extends TaxiConfirmState {}

class TaxiConfirmed extends TaxiConfirmState {}

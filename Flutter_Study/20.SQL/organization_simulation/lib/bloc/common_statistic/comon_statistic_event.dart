part of 'comon_statistic_bloc.dart';

abstract class ComonStatisticEvent extends Equatable {
  const ComonStatisticEvent();

  @override
  List<Object> get props => [];
}

class ComonStatisticInit extends ComonStatisticEvent {}

class ComonStatisticDownLoad extends ComonStatisticEvent {}

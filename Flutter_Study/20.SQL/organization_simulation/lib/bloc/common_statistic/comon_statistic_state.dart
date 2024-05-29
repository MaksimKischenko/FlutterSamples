part of 'comon_statistic_bloc.dart';

abstract class ComonStatisticState extends Equatable {
  const ComonStatisticState();
  
  @override
  List<Object?> get props => [];
}


class ComonStatisticLoading extends ComonStatisticState {}

class ComonStatisticInitial extends ComonStatisticState {}

class ComonStatisticSucces extends ComonStatisticState {
  final String fileName;
  final int rowCount;

  const ComonStatisticSucces({
    required this.fileName,
    required this.rowCount,
  });

  @override
  List<Object?> get props => [fileName, rowCount];

}

class ComonStatisticInitialError extends ComonStatisticState {
  final Object? error;

  const ComonStatisticInitialError({this.error});

  @override
  List<Object?> get props => [error];
}

class ComonStatisticError extends ComonStatisticState {
  final Object? error;

  const ComonStatisticError({this.error});

  @override
  List<Object?> get props => [error];
}

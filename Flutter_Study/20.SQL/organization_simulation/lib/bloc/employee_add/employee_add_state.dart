part of 'employee_add_bloc.dart';

abstract class EmployeeAddState extends Equatable {
  const EmployeeAddState();
  
  @override
  List<Object?> get props => [];
}


class EmployeeAddLoading extends EmployeeAddState {}

class EmployeeAddInitial extends EmployeeAddState {
  final List<Worker>? workers;

   EmployeeAddInitial({
     this.workers,
  });

  @override
  List<Object?> get props => [workers];
}


class EmployeeAddSucces extends EmployeeAddState {
  final String? name;

  const EmployeeAddSucces({
    required this.name,
  });

  @override
  List<Object?> get props => [name];
}

class EmployeeAddInitialError extends EmployeeAddState {
  final Object? error;

  const EmployeeAddInitialError({this.error});

  @override
  List<Object?> get props => [error];
}

class EmployeeAddRunError extends EmployeeAddState {
  final Object? error;

  const EmployeeAddRunError({this.error});

  @override
  List<Object?> get props => [error];
}



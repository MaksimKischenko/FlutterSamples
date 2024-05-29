part of 'employee_add_bloc.dart';

abstract class EmployeeAddEvent extends Equatable {
  const EmployeeAddEvent();

  @override
  List<Object> get props => [];
}


class EmployeeAddInit extends EmployeeAddEvent {}

class EmployeeAddRun extends EmployeeAddEvent {
  final Worker worker;

  const EmployeeAddRun({
     required this.worker,
  });

  @override
  List<Object> get props => [worker];
  
}

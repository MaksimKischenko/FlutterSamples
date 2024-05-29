part of 'manager_add_bloc.dart';

abstract class ManagerAddEvent extends Equatable {
  const ManagerAddEvent();

  @override
  List<Object> get props => [];
}


class ManagerAddInit extends ManagerAddEvent{}

class ManagerAddRun extends ManagerAddEvent {
  final Worker worker;

  const ManagerAddRun({
     required this.worker,
  });

  @override
  List<Object> get props => [worker];
  
}

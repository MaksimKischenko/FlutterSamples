part of 'manager_add_bloc.dart';

abstract class ManagerAddState extends Equatable {
  const ManagerAddState();
  
  @override
  List<Object?> get props => [];
}

class ManagerAddLoading extends ManagerAddState {}

class ManagerAddInitial extends ManagerAddState {

  final List<Worker>? workers;

   ManagerAddInitial({
     this.workers,
  });

  @override
  List<Object?> get props => [workers];
  
}


class ManagerAddSucces extends ManagerAddState {
  final String? name;

  const ManagerAddSucces({
    required this.name,
  });

  @override
  List<Object?> get props => [name];
}

class ManagerAddInitialError extends ManagerAddState {
  final Object? error;

  const ManagerAddInitialError({this.error});

  @override
  List<Object?> get props => [error];
}


class ManagerAddRunError extends ManagerAddState {
  final Object? error;

  const ManagerAddRunError({this.error});

  @override
  List<Object?> get props => [error];
}
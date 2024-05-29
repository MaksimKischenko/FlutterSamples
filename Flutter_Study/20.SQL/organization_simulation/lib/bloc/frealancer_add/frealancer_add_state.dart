part of 'frealancer_add_bloc.dart';

abstract class FrealancerAddState extends Equatable {
  const FrealancerAddState();
  
  @override
  List<Object?> get props => [];
}

class FrealancerAddLoading extends FrealancerAddState {}

class FrealancerAddInitial extends FrealancerAddState {

  final List<Worker>? workers;

  FrealancerAddInitial({
     this.workers,
  });

  @override
  List<Object?> get props => [workers];
}

class FrealancerAddSucces extends FrealancerAddState {
  final String? name;

  const FrealancerAddSucces({
    required this.name,
  });

  @override
  List<Object?> get props => [name];
}

class FrealancerAddInitialError extends FrealancerAddState {
  final Object? error;

  const FrealancerAddInitialError({this.error});

  @override
  List<Object?> get props => [error];
}

class FrealancerAddRunError extends FrealancerAddState {
  final Object? error;

  const FrealancerAddRunError({this.error});

  @override
  List<Object?> get props => [error];
}
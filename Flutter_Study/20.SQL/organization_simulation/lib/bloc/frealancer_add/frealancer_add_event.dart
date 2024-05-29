part of 'frealancer_add_bloc.dart';

abstract class FrealancerAddEvent extends Equatable {
  const FrealancerAddEvent();

  @override
  List<Object> get props => [];
}


class FrealancerAddInit extends FrealancerAddEvent {}

class FrealancerAddRun extends FrealancerAddEvent {
  final Worker worker;

  const FrealancerAddRun({
     required this.worker,
  });

  @override
  List<Object> get props => [worker];
}
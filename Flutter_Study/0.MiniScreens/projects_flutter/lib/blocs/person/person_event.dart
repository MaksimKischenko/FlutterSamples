part of 'person_bloc.dart';

abstract class PersonEvent extends Equatable {
  const PersonEvent();

  @override
  List<Object?> get props => [];
}

class PersonRefresh extends PersonEvent {}

class PersonLoadMore extends PersonEvent {
  final int page;
  PersonLoadMore({
    required this.page,
  });

  @override
  List<Object?> get props => [page];
}

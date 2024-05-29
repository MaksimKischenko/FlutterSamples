part of 'person_bloc.dart';

abstract class PersonState extends Equatable {
  const PersonState();

  @override
  List<Object?> get props => [];
}

class PersonLoading extends PersonState {}

class PersonsViewList extends PersonState {
  final int currentPage;
  final List<Person> persons;
  final bool availableLoadMore;

  PersonsViewList({
    required this.currentPage,
    required this.persons,
    required this.availableLoadMore,
  });

  @override
  List<Object> get props => [currentPage, persons, availableLoadMore];
}

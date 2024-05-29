import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:untitled1/models/person.dart';
import 'package:untitled1/services/services.dart';
import 'package:http/http.dart' as http;

part 'person_event.dart';
part 'person_state.dart';

class PersonBloc extends Bloc<PersonEvent, PersonState> {
  PersonBloc() : super(PersonLoading());

  List<Person> persons = [];
  static int loadCount = 4;

  @override
  Stream<PersonState> mapEventToState(
    PersonEvent event,
  ) async* {
    if (event is PersonRefresh) {
      yield* _mapPersonRefreshToState(event);
    } else if (event is PersonLoadMore) {
      yield* _mapPersonLoadMoreToState(event);
    }
  }

  Stream<PersonState> _mapPersonRefreshToState(PersonRefresh event) async* {
    yield PersonLoading();
    final _response = await PersonService.fetchPersons(client: http.Client());
    persons = _response.persons;
    yield PersonsViewList(
        currentPage: 1, persons: persons, availableLoadMore: true);
  }

  Stream<PersonState> _mapPersonLoadMoreToState(PersonLoadMore event) async* {
    yield PersonLoading();
    final _response = await PersonService.fetchPersons(
        client: http.Client(), page: event.page);
    persons.addAll(_response.persons);

    yield PersonsViewList(
        currentPage: event.page,
        persons: persons,
        availableLoadMore: _response.totalPages != event.page);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:untitled1/blocs/blocs.dart';
import 'package:untitled1/models/models.dart';
import 'package:untitled1/screens/persons/widgets/person_item.dart';
import 'package:untitled1/screens/screens.dart';

// ignore: must_be_immutable
class PersonsList extends StatelessWidget {
  final int page;
  final List<Person> persons;
  final bool availableLoadMore;

  PersonsList({
    Key? key,
    required this.page,
    required this.persons,
    required this.availableLoadMore,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: persons.length,
            itemBuilder: (context, index) {
              return PersonItem(
                person: persons[index],
                onTap: (person) => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => PersonScreen(person: person))),
              );
            },
          ),
          availableLoadMore
              ? TextButton(
                  onPressed: () => context
                      .read<PersonBloc>()
                      .add(PersonLoadMore(page: page + 1)),
                  child: Text('Load more'))
              : Text('No more elements')
        ],
      ),
    );
  }
}

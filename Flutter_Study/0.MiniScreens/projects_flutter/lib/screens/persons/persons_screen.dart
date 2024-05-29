import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/blocs/person/person_bloc.dart';
import 'package:untitled1/screens/persons/widgets/persons_list.dart';


import 'widgets/widgets.dart';

class PersonsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Persons list"),
        ),
        body: BlocBuilder<PersonBloc, PersonState>(builder: (context, state) {
          Widget body = Container();
          if (state is PersonLoading) {
            body = Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: double.maxFinite),
                CircularProgressIndicator()
              ],
            );
          } else if (state is PersonsViewList) {
            body = PersonsList(
                page: state.currentPage,
                persons: state.persons,
                availableLoadMore: state.availableLoadMore);
          }
          return body;
        }));
  }
}

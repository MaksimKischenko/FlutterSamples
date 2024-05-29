import 'package:flutter/material.dart';
import 'package:todolist_hive/widgets/widgets.dart';

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TODO LIST',
      routes: {
        '/groups/': (context) => const GroupsWidget(),
        '/groups/form': (context) => const GroupsFormWidget(),
      },
      initialRoute: '/groups/',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
    );
  }
}
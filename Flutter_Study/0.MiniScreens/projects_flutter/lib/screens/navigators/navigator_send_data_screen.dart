import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Todo {
  final String title;
  final String description;

  Todo(this.title, this.description);
}

class SendDataScreenApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //initialRoute: '/',
      onGenerateRoute: (settings) {
        if (settings.name == '/') {
          return MaterialPageRoute(
            builder: (context) => TodosScreen(
              todos: List.generate(
                20,
                (i) => Todo(
                  'Todo $i',
                  'A description of what needs to be done for Todo $i',
                ),
              ),
            ),
          );
        } else if (settings.name == '/todo') {
          final arg = settings.arguments as Todo;
          return MaterialPageRoute(
            builder: (context) => DetailScreen(
              todo: arg,
            ),
          );
        }
      },
      title: 'Passing Data',
    );
  }
}

class TodosScreen extends StatelessWidget {
  final List<Todo>? todos;

  TodosScreen({Key? key, @required this.todos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todos'),
      ),
      body: ListView.builder(
        itemCount: todos!.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(todos![index].title),
            // When a user taps the ListTile, navigate to the DetailScreen.
            // Notice that you're not only creating a DetailScreen, you're
            // also passing the current todo through to it.
            onTap: () {
              Navigator.of(context)
                  .pushNamed('/todo', arguments: todos![index]);
            },
          );
        },
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final Todo? todo;

  DetailScreen({Key? key, @required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(todo!.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(todo!.description),
      ),
    );
  }
}

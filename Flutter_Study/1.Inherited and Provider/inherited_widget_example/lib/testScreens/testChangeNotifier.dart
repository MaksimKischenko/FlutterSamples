import 'package:flutter/material.dart';

class TestChangeNotifier extends StatelessWidget {
  const TestChangeNotifier({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: SimpleScrollExample()
        )
      ),
    );
  }
}


class SimpleScrollExample extends StatefulWidget {
  const SimpleScrollExample({Key? key}) : super(key: key);

  @override
  State<SimpleScrollExample> createState() => _SimpleScrollExampleState();
}

class _SimpleScrollExampleState extends State<SimpleScrollExample> {

  final _model = ListScrollModel();
  var user = User(age: 1, name: 'Tesla');

  @override
  Widget build(BuildContext context) {
    return Center(
      child: UserListProvider(
        widget: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AddButtonWidget(
              element: user
            ),
            RemoveButtonWidget(element: user),
            const ClearButtonWidget(),
            const ResultList(),
          ],
        ),
        model: _model, 
      ),
    );
  }
}


class AddButtonWidget extends StatelessWidget {

  User element;

  AddButtonWidget({ 
    required this.element,
    Key? key 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => UserListProvider.read(context)?.addToList(element),
      child: const Text('Add'),
    );
  }
}


class RemoveButtonWidget extends StatelessWidget {

  User element;

  RemoveButtonWidget({ 
    required this.element,
    Key? key 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => UserListProvider.read(context)?.removeFromList(element),
      child: const Text('Remove'),
    );
  }
}


class ClearButtonWidget extends StatelessWidget {

  const ClearButtonWidget({ 
    Key? key 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => UserListProvider.read(context)?.clearList(),
      child: const Text('Clear'),
    );
  }
}

class ListScrollModel<T extends User> extends ChangeNotifier {

  List<T> scrollElements = [ ];

  void addToList(T value) {
    scrollElements.add(value);
    notifyListeners(); 
  }

  void removeFromList(T value) {
    scrollElements.remove(value);
    notifyListeners(); 
  }

  void clearList() {
    scrollElements.clear();
    notifyListeners(); 
  }
}


class UserListProvider extends InheritedNotifier<ListScrollModel> {

  final ListScrollModel model;

  const UserListProvider({
    required Widget widget,
        required this.model,
        Key? key,
  }) : super(key: key, notifier: model, child: widget);


  // @override
  // bool updateShouldNotify(UserListProvider oldWidget) {
  //   return model != oldWidget.model;
  // }

  // static UserListProvider? of(BuildContext context) {
  //   return context.dependOnInheritedWidgetOfExactType<UserListProvider>();
  // }


  static ListScrollModel? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<UserListProvider>()?.notifier;
  }

  //Более адекватный пример для того чтобы не было дополнительных обновлений build()
  static ListScrollModel? read(BuildContext context) {
    final widget = context.getElementForInheritedWidgetOfExactType<UserListProvider>()?.widget;
    return widget is UserListProvider ? widget.notifier : null;
  }
}


class ResultList extends StatefulWidget {
  const ResultList({ Key? key }) : super(key: key);

  @override
  State<ResultList> createState() => _ResultListState();
}

class _ResultListState extends State<ResultList> {
  List<User>? users = [];

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
 
  //   final model = UserListProvider.of(context)?.model;

  //   model?.addListener(() {
  //       users = model.scrollElements;
  //       setState(() {});
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    users = UserListProvider.watch(context)?.scrollElements;
    return Text('Result: $users');
  }
}


class User {
  final int age;
  final String name;
  
  User({
    required this.age,
    required this.name,
  });

  @override
  String toString() => 'User(age: $age, name: $name)';

  User copyWith({
    int? age,
    String? name,
  }) {
    return User(
      age: age ?? this.age,
      name: name ?? this.name,
    );
  }
}

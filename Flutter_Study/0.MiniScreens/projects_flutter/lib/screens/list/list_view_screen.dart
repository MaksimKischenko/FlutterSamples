import 'package:flutter/material.dart';

class UsersList extends StatefulWidget {
  @override
  _UsersListState createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  final List<String> users = List.generate(20, (index) => 'item $index');
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
                Text(
                    selectedIndex == -1
                        ? "Не выбрано"
                        : "Выбрано: ${users[selectedIndex]}",
                    style: TextStyle(fontSize: 30)),
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.only(top: 16), //самого листа отстпуп
                    itemCount: users.length,
                    itemBuilder: (context, index) => _createListView(index),
                ))
            ]),
    );
  }

  Widget _createListView(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          // устанавливаем индекс выделенного элемента
          selectedIndex = index;
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        padding: EdgeInsets.symmetric(vertical: 8),
        color: index == selectedIndex ? Colors.green : Colors.red,
        child: Text(users[index], style: TextStyle(fontSize: 24)),
      ),
    );
  }
}

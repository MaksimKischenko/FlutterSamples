import 'package:flutter/material.dart';

class DismissingItemScreen extends StatefulWidget {
  
  static String routeName = '/_fitchesDemos/02_Dissmisingitems';

  @override
  _DismissingItemScreenAppState createState() {
    return _DismissingItemScreenAppState();
  }
}

class _DismissingItemScreenAppState extends State<DismissingItemScreen> {
  final items = List<String>.generate(20, (i) => 'Item ${i + 1}');

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Dissmising items'),
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return Dismissible(
              // Each Dismissible must contain a Key. Keys allow Flutter to
              // uniquely identify widgets.
              key: Key(item),
              // Provide a function that tells the app
              // what to do after an item has been swiped away.
              onDismissed: (direction) {
                // Remove the item from the data source.
                setState(() {
                  items.removeAt(index);
                });

                // Then show a snackbar.
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text('$item dismissed')));
              },
              // Show a red background as the item is swiped away.
              background: Container(color: Colors.red),
              child: ListTile(
                title: Text(item),
              ),
            );
          },
        ),
      );
  }
}
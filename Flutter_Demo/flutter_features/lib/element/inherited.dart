import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Item {
    Item(this.reference);
  
    String reference;
  }
  
  class _MyInherited extends InheritedWidget {
    const _MyInherited({
      required super.child,
      required this.data,
    });
  
    final MyInheritedWidgetState data;

    static MyInheritedWidgetState? of(BuildContext context) {
      return (context.dependOnInheritedWidgetOfExactType<_MyInherited>())
          ?.data;
    }
    
    @override
    bool updateShouldNotify(_MyInherited oldWidget) => true;
  }
  
  class MyInheritedWidget extends StatefulWidget {
    const MyInheritedWidget({
      super.key,
      required this.child,
    });
  
    final Widget child;
  
    @override
    MyInheritedWidgetState createState() => MyInheritedWidgetState();
  
    static MyInheritedWidgetState? of(BuildContext context, [bool rebuild = true]){
        return (rebuild
            ? context.dependOnInheritedWidgetOfExactType<_MyInherited>()
            : context.findAncestorWidgetOfExactType<_MyInherited>())
        ?.data;
    }
  }
  
  class MyInheritedWidgetState extends State<MyInheritedWidget> {
    // List of Items
    final List<Item> _items = <Item>[];
  
    // Getter (number of items)
    int get itemsCount => _items.length;
  
    // Helper method to add an Item
    void addItem(String reference) {
      if (mounted) {
        setState(() {
          _items.add(Item(reference));
        });
      }
    }
  
    @override
    Widget build(BuildContext context) {
      return _MyInherited(
        data: this,
        child: widget.child,
      );
    }
  }
  
  class MyTree extends StatefulWidget {
    const MyTree({super.key});
  
    @override
    // ignore: library_private_types_in_public_api
    _MyTreeState createState() => _MyTreeState();
  }
  
  class _MyTreeState extends State<MyTree> {
    @override
    Widget build(BuildContext context) {
      return MyInheritedWidget(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Title'),
          ),
          body: const Column(
            children: <Widget>[
              WidgetA(),
              Row(
                children: <Widget>[
                  Icon(Icons.shopping_cart),
                  Expanded(child: WidgetB()),
                  WidgetC(),
                ],
              ),
            ],
          ),
        ),
      );
    }
  }
  
  class WidgetA extends StatelessWidget {
    const WidgetA({super.key});
  
    @override
    Widget build(BuildContext context) {
      final MyInheritedWidgetState? state = MyInheritedWidget.of(context);
      return ElevatedButton(
        child: const Text('Add Item'),
        onPressed: () {
          state?.addItem('new item');
        },
      );
    }
  }
  
  class WidgetB extends StatelessWidget {
    const WidgetB({super.key});
  
    @override
    Widget build(BuildContext context) {
      final MyInheritedWidgetState? state = MyInheritedWidget.of(context);
      return Text('${state?._items}');
    }
  }
  
  class WidgetC extends StatelessWidget {
    const WidgetC({super.key});
  
    @override
    Widget build(BuildContext context) {
      return const Text('I am Widget C');
    }
  }

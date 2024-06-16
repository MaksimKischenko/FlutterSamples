import 'package:flutter/material.dart';

class PageStorageKeyMy extends StatelessWidget {
  const PageStorageKeyMy({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PageView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          switch (index) {
            case 0 :
              return Container(
                color: Colors.green[100],
                child: const _Page(key: PageStorageKey(1))
              );
            case 1 :
              return Container(
                color: Colors.blue[100],
                child: const Text('Blank page'),
              );
            case 2 :
              return Container(
                color: Colors.red[100],
                child:const _Page(key: PageStorageKey(2))
              );
            default:
                throw 404;
          }
        }
      ),
    );
  }
}

class _MyPageStorageIdintifier {
  final Key key;
  final String name;

  _MyPageStorageIdintifier(this.key, this.name);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is _MyPageStorageIdintifier &&
      other.key == key &&
      other.name == name;
  }

  @override
  int get hashCode => key.hashCode ^ name.hashCode;
}


class _Page extends StatefulWidget {
  const _Page({ Key? key }) : super(key: key);

  @override
  State<_Page> createState() => _PageState();
}

class _PageState extends State<_Page> {

  final _contriller = TextEditingController();

  void setupValuePersistance() {
    final key = widget.key;
    if(key== null) return;
    final identifier = _MyPageStorageIdintifier(key, 'text');

    final dynamic value = PageStorage.of(context)?.readState(context, identifier: identifier);
    _contriller.text = value is String ? value: '';
    _contriller.addListener(() { 
      PageStorage.of(context)?.writeState(context, _contriller.text, identifier: identifier);
    });
  }

  @override
  void initState() {
    super.initState();
    setupValuePersistance();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextField(
        controller: _contriller,
      ),
    );
  }

  @override
  void dispose() {
    _contriller.dispose();
    super.dispose();
  }
}
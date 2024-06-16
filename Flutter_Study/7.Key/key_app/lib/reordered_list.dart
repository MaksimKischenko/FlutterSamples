import 'package:flutter/material.dart';

class ReorderedExample extends StatefulWidget {
  const ReorderedExample({ Key? key }) : super(key: key);

  @override
  _ReorderedExampleState createState() => _ReorderedExampleState();
}

class _ReorderedExampleState extends State<ReorderedExample> {

  var ints = List<String>.generate(10, (index) => index.toString());

  void _onReorder(int from, int to) {
    setState(() {
      if(from < to) {
        to -= 1;
      }
      final element = ints.removeAt(from);
      ints.insert(to, element);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ReorderableListView.builder(
      itemCount: ints.length,
      itemBuilder: (BuildContext context, int index) {
        return GreenBox(
          key: ValueKey(ints[index])  //Unique key бы не помог!
        );
      },
      onReorder: _onReorder,
    );
  }
}


class GreenBox extends StatefulWidget {
  const GreenBox({ Key? key }) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  _GreenBoxState createState()  {
    // ignore: avoid_print
    print('GreenBox createState');
    return _GreenBoxState();
  }
}

class _GreenBoxState extends State<GreenBox> {

  var _text = 'start';
  var isDeactivated  = false;
  var isDisposed  = false;

  void _changeText(String text) {
    _text = text;
    setState(() {
      
    });
  }
  _GreenBoxState() {
    print('GreenBox state init');
  }

  @override
  void initState() {
    super.initState();
    print('GreenBox initState');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('GreenBox didChangeDependencies');
  }

  @override
  void didUpdateWidget(GreenBox oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('GreenBox didUpdateWidget');
  }

  @override
  void reassemble() {
    super.reassemble();
    print('GreenBox reassemble');
  }

  @override
  Widget build(BuildContext context) {
    print('GreenBox build is deactivated : $isDeactivated, isDisposed: $isDisposed');

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        color: Colors.green,
        child: Column(
          children: [
            Text(_text),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                onChanged: _changeText,
                decoration: const InputDecoration(
                  border: OutlineInputBorder()
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void deactivate() {
    super.deactivate();
  }
}
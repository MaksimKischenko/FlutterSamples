// ignore: file_names
import 'package:flutter/material.dart';


//Когда мы вызываем код в обычном порядке то по цепочке вызова вызываются методы build - и работает наш код 
// Но если мы сделаем наши классы как CONST то код больше не станет работать так как по идее должен 
// Зачем нам нужен const? - чтобы не вызывать снова методы build 

class FindAncestorStateOfTypeExample extends StatelessWidget {
  const FindAncestorStateOfTypeExample({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: DataOwnerStatefull()
        ),
      ),
    );
  }
}

class DataOwnerStatefull extends StatefulWidget {
  const DataOwnerStatefull({ Key? key }) : super(key: key);

  @override
  DataOwnerStatefullState createState() => DataOwnerStatefullState();
}

class DataOwnerStatefullState extends State<DataOwnerStatefull> {

  var value = 0;

  void _incriment() {
    value +=1;
    setState(() { });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: _incriment, 
          child: const Text('+')
        ),
         DataConsumerStateless()
      ],
    );
  }
}

class DataConsumerStateless extends StatelessWidget {
   const DataConsumerStateless({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final value = context.findAncestorStateOfType<DataOwnerStatefullState>()?.value ?? 0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('$value'),
        DataConsumerStatefull()
      
      ],
    );
  }
}

class DataConsumerStatefull extends StatefulWidget {
   const DataConsumerStatefull({ Key? key }) : super(key: key);

  @override
  _DataConsumerStatefullState createState() => _DataConsumerStatefullState();
}

class _DataConsumerStatefullState extends State<DataConsumerStatefull> {
  @override
  Widget build(BuildContext context) {

    final value = context.findAncestorStateOfType<DataOwnerStatefullState>()?.value ?? 0;
    return Text('$value');
  }
}

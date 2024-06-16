import 'package:flutter/material.dart';

final key = GlobalKey();


class ShareStateGlobal extends StatelessWidget {
  const ShareStateGlobal({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PageView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          //Одинаковый класс и ключ = ОДИН И ТОТ ЖЕ ВИДЖЕТ!
          //НЕЛЬЗЯ одновременно в дереве виджетов использовать один и тот же уникальный ключ дважды!
          // (только если есть переходные страницы)
          switch (index) {
            case 0 :
              return Container(
                color: Colors.green[100],
                child: Foo(key),
              );
            case 1 :
              return Container(
                color: Colors.blue[100],
                child: const Text('Blank page'),
              );
            case 2 :
              return Container(
                color: Colors.red[100],
                child: Foo(key),
              );
            default:
                throw 404;
          }
        }
      ),
    );
  }
}

class Foo extends StatefulWidget {
  const Foo(Key? key) : super(key: key);

  @override
  _FooState createState() => _FooState();
}

class _FooState extends State<Foo> {

  bool _switchValue = false;
  double _sliderValue = 0.5;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Switch(
          value: _switchValue, 
          onChanged: (v) {
            setState(() {
              _switchValue = v;
            });
          }
        ),
        Slider(
          value: _sliderValue, 
          onChanged: (v) {
            setState(() {
              _sliderValue = v;
            });
          }
        )
      ],
    );
  }
}
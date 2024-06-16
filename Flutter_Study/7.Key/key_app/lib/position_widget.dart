import 'dart:math';

import 'package:flutter/material.dart';

class PositionedTitles extends StatefulWidget {
  const PositionedTitles({ Key? key }) : super(key: key);

  @override
  State<PositionedTitles> createState() => _PositionedTitlesState();
}

class _PositionedTitlesState extends State<PositionedTitles> {


// теперь он сравнивает не только классы но еще и ключи! 
// Эти ключи следует добавлять лишь на последний уровнь иначе изменений не произойдет! (например если сделаем padding)
  List<Widget> titles = [
    Padding(
      key: UniqueKey(), // добавим ключ чтобы работало и на верхнем уровне!!! (ключ нужен там где общий контейнер) 
      padding: const EdgeInsets.all(8.0),
      child: StatelessColorTitle(key: UniqueKey()),
    ),
    Padding(
      key: UniqueKey(),
      padding: const EdgeInsets.all(8.0),
      child: StatelessColorTitle(key: UniqueKey()),
    )
  ];


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: swapTitles, 
          child: const Text('Press')
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: titles,
        )
      ],
    );
  }

  void swapTitles() {
    setState(() {
      titles.insert(1, titles.removeAt(0));
    });
  }
}

//Будет работать пока они StatelessWidget

// class StatelessColorTitle extends StatelessWidget {
//   final myColor = UniqueColorGenerator.getColor();

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 100,
//       height: 100,
//       color: myColor
//     );
//   }
// }

//Наш стейт хранится отдельно от виджета! И когда мы после билда рисуем картинку
// то сравниваю по классу (а они одни и теже) он видит что стейт не поменялся!
//В игру должны вступить ключи 

class StatelessColorTitle extends StatefulWidget {
  const StatelessColorTitle({Key? key}) : super(key: key);

  @override
  State<StatelessColorTitle> createState() => _StatelessColorTitleState();
}

class _StatelessColorTitleState extends State<StatelessColorTitle> {
  final myColor = UniqueColorGenerator.getColor();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: myColor
    );
  }
}

class UniqueColorGenerator {

  static final _random = Random();
  static Color getColor() {
    return Color.fromRGBO(
      _random.nextInt(256),
      _random.nextInt(256),
      _random.nextInt(256),
      1.0
    );
  }
}
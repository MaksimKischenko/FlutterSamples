import 'package:flutter/material.dart';

import 'hero/detail_screen.dart';


//Часто бывает полезно направлять пользователей через приложение, когда они переходят от экрана к экрану. 
//Распространенный метод ведения пользователей через приложение - это анимация виджета с одного экрана на другой. 
//Это создает визуальный якорь, соединяющий два экрана.
//Используйте виджет Героя, чтобы анимировать виджет с одного экрана на другой. В этом рецепте используются следующие шаги:

// Создайте два экрана, показывающих одно и то же изображение.
// Добавьте виджет Героя на первый экран.
// Добавьте виджет Героя на второй экран.


class HeroScreen extends StatelessWidget {
  
static String routeName = '/_fitchesDemos/01_hero';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Main Screen'),
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return  DetailScreen();
          }));
        },
        child: Hero(
          tag: 'imageHero',
          child: Image.network(
            'https://picsum.photos/250?image=9',
          ),
        ),
      ),
    );
  }
}
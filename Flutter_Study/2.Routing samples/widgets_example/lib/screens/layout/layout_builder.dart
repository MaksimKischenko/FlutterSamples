import 'dart:ui';

import 'package:flutter/material.dart';


class LayoutBuilderDemo extends StatefulWidget {

  static String routName = '/_layoutDemos/03_layOutBuilder';

  @override
  _LayoutBuilderDemoState createState() => _LayoutBuilderDemoState();
}

class _LayoutBuilderDemoState extends State<LayoutBuilderDemo> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Tooltip(
            textStyle: TextStyle(fontSize: 24),
            message: 'LayoutBuilder помогает создать дерево виджетов во флаттере виджетов, которое может зависеть от размера исходного виджета. флаттер может принимать компоновщик компоновки в качестве параметра. Он имеет два параметра. построить контекст и Boxconstrant. BuildContext относится к виджету. Но ограничение поля более важно, оно дает ширину родительскому виджету, который используется для управления дочерним элементом в соответствии с размером родителя.Примечание. Основное различие между Media Query и LayoutBuilder заключается в том, что Media Query использует полный контекст экрана, а не размер вашего конкретного виджета. В то время как компоновщик макетов может определить максимальную ширину и высоту любого виджета.',
            child: Text('LayoutBuilder Demo')
          ),
          centerTitle: true,
        ),
        body: Container(
          /// Giving dimensions to parent Container
          /// using MediaQuery
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,

          child: LayoutBuilder(
            builder: (BuildContext ctx, BoxConstraints constraints) {
              // if the screen width >= 480 i.e Wide Screen
              if (constraints.maxWidth >= 480) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding:EdgeInsets.symmetric(horizontal: 8),
                      alignment: Alignment.center,
                      height: constraints.maxHeight * 0.3,
                      margin: EdgeInsets.fromLTRB(10.0, 0.0,10.0,0.0),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Text(
                        'Left Wide Screen',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      padding:EdgeInsets.symmetric(horizontal: 8),
                      alignment: Alignment.center,
                      height: constraints.maxHeight * 0.3,
                      margin: EdgeInsets.fromLTRB(10.0, 0.0,10.0,0.0),
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Text(
                        'Right Wide Screen',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                );

                // If screen size is < 480
              } else {
                return Container(
                  alignment: Alignment.center,
                  height: constraints.maxHeight * 0.3,
                  margin: EdgeInsets.fromLTRB(10.0, 0.0,10.0,0.0),
                  decoration: BoxDecoration(
                    color: Colors.cyan,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Text(
                    'Normal Screen',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
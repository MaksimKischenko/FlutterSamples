import 'package:flutter/material.dart';

class DrugDropScreen extends StatelessWidget {

static String routeName = '/_animationsDemos/02_DrugDrop';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('DrugDrop'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DragTarget(
              builder: (BuildContext context, List<String?> accepded,List<dynamic> rejected) {
                return Container(
                  width: 200,
                  height: 200,
                  color: Colors.lightBlue,
                );
              },
              onAccept: (data) =>print(data),
            ),
            Container(height: 50),
            Draggable(
              //!magic!!!
              data: 'Dragged!',
              child: Container(
                width: 100, 
                height: 100,
                color: Colors.red,
              ), 
              feedback: Container(
                width: 100, 
                height: 100,
                color: Colors.yellow,
              ),
            )
          ]
        ),
      ),
    );
  }
}
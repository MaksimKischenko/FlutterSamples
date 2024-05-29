import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:organization_simulation/database/workers_database.dart';
import 'package:organization_simulation/models/models.dart';

class TestDataBaseScreen2 extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('DB')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CupertinoButton(child: Text('insert'), color:Colors.blue, onPressed: () async {

              await WorkersDataBaseHelper.instance.insertWorker(Worker(
              name: '<Max>', 
              position: 'Manager', 
              salary: 10000, 
              hoursInMonth: 154
             ));
             
            }),
            CupertinoButton(child: Text('query'),color:Colors.grey, onPressed: () async {
              List<Worker> workers = await WorkersDataBaseHelper.instance.allWorkers();
              print(workers);
              
            }),
            CupertinoButton(child: Text('update'),color:Colors.red, onPressed: () async {
              await WorkersDataBaseHelper.instance.updateWorker(Worker(
              id: 1,
              name: '<Max22222222222222>', 
              position: 'Manager', 
              salary: 10000, 
              hoursInMonth: 1542222
             ));
            }),
            CupertinoButton(child: Text('delete'),color:Colors.green, onPressed: () async {
               for (var i = 8; i < 18; i++) {
                 await WorkersDataBaseHelper.instance.deleteWorker(i);
               } 
            }),
          ],
        ),
      ) ,
    );
  }
}
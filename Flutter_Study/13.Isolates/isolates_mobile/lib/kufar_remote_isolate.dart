
import 'dart:developer';
import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:isolates_mobile/data.dart';
import 'package:isolates_mobile/data/data_manager.dart';
import 'package:isolates_mobile/data/remote_models/get_goods_response.dart';
import 'package:isolates_mobile/injection_component.dart';


Future<void> main() async{
  InjectionComponent.run();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

 final dataManager = InjectionComponent.getDependency<DataManager>(); 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: ElevatedButton(
          onPressed: () async{
            computeIsolate(getGoods);
           }, 
          child: const Text('PUSH')
        ),        
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text('WITH ISOL'),
        ),
        body: Center(
          child: FutureBuilder(
            future: computeIsolate(getGoods),
            builder: (context, snapshot) {
              if(snapshot.connectionState == ConnectionState.done) {
                var items =  snapshot.data?.adsItemList ?? []; 
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Column(
                        children: [
                        ListTile(
                          leading: Text('${items[index].listTime}'),
                          title: Text(items[index].subject),                                  
                        )
                        ],
                      ),
                    );
                  },
                );
              } else if(snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,                    
                    children: [
                      TextField(),
                      CircularProgressIndicator(),
                    ],
                  )
                );
              } else if(snapshot.connectionState == ConnectionState.active) {
                return const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,                    
                    children: [
                      Text('ACTIVE STATE'),
                      CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(Colors.amber),
                      ),
                    ],
                  )
                );
              }
              return Container(
                color: Colors.amberAccent,
              );
            }
          )
        ),
      ),
    );
  }

  Future<dynamic> computeIsolate(Future Function(int i) function) async {
    log('computeIsolate');
    var stopWatch = Stopwatch()..start();    
    final receivePort = ReceivePort();
    var rootToken = RootIsolateToken.instance!;
    Isolate.spawn<IsolateData>(
      fetchDataIsolate,
      IsolateData(
        token: rootToken,
        function: function,
        answerPort: receivePort.sendPort,
      ),
      debugName: 'ISOL',
    );
    Stopwatch().stop();
    log('computeIsolate_STOPWATSH ${stopWatch.elapsedMilliseconds}'); 
    return receivePort.first;
  }  

 Future<void> fetchDataIsolate(IsolateData isolateData) async{
    log('fetchDataIsolate');
    var stopWatch = Stopwatch()..start();    
    final poems = await isolateData.function(100000000); 
    isolateData.answerPort.send(poems);
    Stopwatch().stop();
    log('fetchDataIsolate_STOPWATSH ${stopWatch.elapsedMilliseconds}');                 
 } 

Future<GoodsInfo> getGoods(int count) async{
  log('getGoods');
  var stopWatch = Stopwatch()..start();      
  var good = dataManager.getGoodsRequest(
    productName: '',
    listSize: count
  ); 
    Stopwatch().stop();
    log('getGoods_STOPWATSH ${stopWatch.elapsedMilliseconds}');       
  return Future(() => good);
  }
}

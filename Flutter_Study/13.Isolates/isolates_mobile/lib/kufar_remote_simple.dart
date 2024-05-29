
import 'package:flutter/material.dart';
import 'package:isolates_mobile/data/data_manager.dart';
import 'package:isolates_mobile/data/remote_models/get_goods_response.dart';
import 'package:isolates_mobile/injection_component.dart';


Future<void> main() async{
  InjectionComponent.run();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: ElevatedButton(
          onPressed: () async{
            getGoods(100000000);
          }, 
          child: const Text('PUSH')
        ),        
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text('WIHOUT ISOL'),
        ),
        body: Center(
          child: FutureBuilder(
            future: getGoods(100000000),
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

Future<GoodsInfo> getGoods(int count) async{
  var stopWatch = Stopwatch()..start();  
  var good =  await InjectionComponent.getDependency<DataManager>().getGoodsRequest(
    productName: '',
    listSize: count
  );  
    Stopwatch().stop();
    print('ALLTIME ${stopWatch.elapsedMilliseconds}');    
  return good;
  }
}

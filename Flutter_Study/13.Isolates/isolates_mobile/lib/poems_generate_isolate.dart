

import 'dart:developer' as logger;
import 'dart:isolate';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:isolates_mobile/data.dart';
import 'package:isolates_mobile/data/remote_models/poem.dart';



Future<void> main() async{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: ElevatedButton(
          onPressed: () {
            print('PUSHED');
          }, 
          child: const Text('PUSH')
        ),
        appBar: AppBar(
          backgroundColor: Colors.green,          
          title: const Text('POEMS WIRH ISOL'),
        ),
        body: Center(
          child: FutureBuilder(
            future: computeIsolate(generatePoems),
            builder: (context, snapshot) {
              if(snapshot.connectionState == ConnectionState.done) {
                var poems =  snapshot.data ?? []; 
                return ListView.builder(
                  itemCount: snapshot.data?.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Text(poems[index].poemTopicName),
                      subtitle: Text(poems[index].title),
                      trailing: Text(poems[index].content),
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
    logger.log('computeIsolate');
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
      debugName: 'ISOL'
    );
    Stopwatch().stop();
    logger.log('computeIsolate_STOPWATSH ${stopWatch.elapsedMilliseconds}');    
    return receivePort.first;
  }  

 Future<void> fetchDataIsolate(IsolateData isolateData) async{
    logger.log('fetchDataIsolate');
    var stopWatch = Stopwatch()..start();    
    final poems = await isolateData.function(10000000); //FUTURE убьет изолят поэтому ждем

    isolateData.answerPort.send(poems);
    Stopwatch().stop();
    logger.log('fetchDataIsolate_STOPWATSH ${stopWatch.elapsedMilliseconds}');                 
 } 

  Future<List<Poem>> generatePoems(int count) async{
    logger.log('generatePoems');
    var stopWatch = Stopwatch()..start();
    final List<Poem> poems = [];
    final Random random = Random();
    for (int i = 0; i < count; i++) {
      final poem = Poem(
        title: 'Poem $i',
        content: 'Content of Poem $i',
        previewContent: 'Preview of Poem $i',
        poemTopicName: 'Topic $i',
        poemTopicAssetLocation: 'assets/topic_$i.jpg',
        isFavorite: random.nextBool(),
      );
      poems.add(poem);
    }
    Stopwatch().stop();
    logger.log('generatePoems_STOPWATSH ${stopWatch.elapsedMilliseconds}');
    return Future(() => poems);
  }
}

//IOS 14 PHONE
//ИТОГО 22 секунды на 10000000
//ИТОГО 2 секунды на 1000000

// var poems =  List<dynamic>.from(json.decode(serPoems) as List)      сериализация убила прилагу
// .map((jsonMap) => Poem.fromJson(Map<String, dynamic>.from(jsonMap)))
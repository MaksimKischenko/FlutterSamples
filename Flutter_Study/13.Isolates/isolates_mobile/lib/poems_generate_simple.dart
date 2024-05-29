
import 'dart:math';
import 'package:flutter/material.dart';

import 'data/remote_models/poem.dart';


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
          backgroundColor: Colors.red,
          title: const Text('POEMS WIHOUT ISOL'),
        ),
        body: Center(
          child: FutureBuilder(
            future: generatePoems(1000000),
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

  Future<List<Poem>> generatePoems(int count) async{
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
    print('ALLTIME ${stopWatch.elapsedMilliseconds}');       
    return Future(() => poems);
  }
}
//ИТОГО 9 секунд на 10000000
//ИТОГО 0.7 секунды на 1000000
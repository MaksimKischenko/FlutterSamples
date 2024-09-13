import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_features/fancy_button.dart';

import 'utils/utils.dart';

void main() {
  

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ScrollController _scrollController = ScrollController();
  late Set<ItemContext> _itemsContexts;


  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_handleScroll);
    _itemsContexts = <ItemContext>{};

  }


  void _handleScroll() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SizedBox(
        height: 400,
        child: LayoutBuilder(
          builder: (context, constraints) {
            log('constraints.maxHeight ${constraints.maxHeight}');
            return ListView.builder(
              itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return _buildItem(index);
                },
            );
          }
        ),
      ),
      floatingActionButton: FancyButton(
        isLoading: false,
        buttonText: 'FANCY',
        onActionPressed: () {
          
        },
        onScrollDownPressed: () {
          return true;
        },
        scrollController: _scrollController,
      )// This trailing comma makes auto-formatting nicer for build methods.
    );
  }

   Widget _buildItem(int index) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        //
        // Record the couple: BuildContext, item index
        //

        _itemsContexts.add(ItemContext(
          context: context,
          id: index,
          height: constraints.maxHeight
        ));
        countTotalHeigth();
        return ListViewItem(itemIndex: index);
      },
    );
  }

  void countTotalHeigth() {
   _itemsContexts.forEach((element) {
     final RenderObject object = element.context.findRenderObject() as RenderBox;
      final RenderAbstractViewport viewport = RenderAbstractViewport.of(object);
      final double vpHeight = viewport.paintBounds.height;
      log('vpHeight: $vpHeight');

   });
  }

}



class ListViewItem extends StatelessWidget {
  const ListViewItem({
    super.key,
    required this.itemIndex,
  });

  final int itemIndex;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: 100.0,
        height: 100.0,
        color: Colors.blue,
        child: Center(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Text('${constraints.maxHeight}', style: const TextStyle(color: Colors.white));
            }
          ),
        ),
      ),
    );
  }
}

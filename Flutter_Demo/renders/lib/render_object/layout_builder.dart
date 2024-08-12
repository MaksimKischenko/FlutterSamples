import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


class ScrollLayoutExample extends StatefulWidget {
  const ScrollLayoutExample({super.key, required this.title});

  final String title;

  @override
  State<ScrollLayoutExample> createState() => _ScrollLayoutExampleState();
}

class _ScrollLayoutExampleState extends State<ScrollLayoutExample> {
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
  Widget build(BuildContext context) =>  SizedBox(
        height: 400,
        ///[LayoutBuilder] в Flutter — это полезный виджет, который позволяет 
        ///создавать динамические интерфейсы, адаптирующиеся к изменениям размеров своих родителей.
        /// Он предоставляет контекст и ограничения для создания вложенного виджета 
        /// на основе доступного пространства.
        child: LayoutBuilder(
          builder: (context, constraints) {
            log('constraints.maxHeight ${constraints.maxHeight}');
            return ListView.builder(
              controller: _scrollController,
              itemCount: 10,
                itemBuilder: (BuildContext context, int index) => _buildItem(index),
            );
          }
        ),
      );


   Widget _buildItem(int index) => LayoutBuilder(
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

  void countTotalHeigth() {
   for (final element in _itemsContexts) {
     final RenderObject object = element.context.findRenderObject() as RenderBox;
      final viewport = RenderAbstractViewport.of(object);
      final vpHeight = viewport.paintBounds.height;
      log('vpHeight: $vpHeight');
   }
  }
}



class ListViewItem extends StatelessWidget {
  const ListViewItem({
    super.key,
    required this.itemIndex,
  });

  final int itemIndex;

  @override
  Widget build(BuildContext context) => Card(
      child: Container(
        width: 100,
        height: 100,
        color: Colors.blue,
        child: Center(
          child: LayoutBuilder(
            builder: (context, constraints) => Text('${constraints.maxHeight}', style: const TextStyle(color: Colors.white))
          ),
        ),
      ),
    );
}


class ItemContext {
  ItemContext({
    required this.context,
    required this.id,
    required this.height,
  });
  final BuildContext context;
  final double height;
  final int id;

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) =>
      identical(this, other) || other is ItemContext && other.id == id;

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode => Object.hashAll([
        id,
      ]);
}
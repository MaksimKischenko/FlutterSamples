import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
// ignore: depend_on_referenced_packages
import 'package:rxdart/rxdart.dart';

void main() {
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Page(),
    );
  }
}

///
/// Helper class that makes the relationship between
/// an item index and its BuildContext
///
class ItemContext {
  ItemContext({
    required this.context,
    required this.id,
  });
  final BuildContext context;
  final int id;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is ItemContext && other.id == id;

  @override
  int get hashCode => Object.hashAll([
        id,
      ]);
}

class Page extends StatefulWidget {
  const Page({super.key});

  @override
  State<Page> createState() => _PageState();
}

class _PageState extends State<Page> {
  //
  // Collection to hold the BuildContext associated with an Item
  //
  late Set<ItemContext> _itemsContexts;

  //
  // Stream to control the scroll events and prevents
  // doing the computations at each scroll
  //
  late BehaviorSubject<ScrollNotification> _streamController;

  @override
  void initState() {
    super.initState();

    // Initialize the collection (of unique items)
    _itemsContexts = <ItemContext>{};

    // Initialize a stream controller
    _streamController = BehaviorSubject<ScrollNotification>();

    //
    // When a scroll notification is emitted, simply bufferize a bit
    // so that we do not compute too much
    //
    _streamController
        .bufferTime(const Duration(
          milliseconds: 100,
        ))
        .where((batch) => batch.isNotEmpty)
        .listen(_onScroll);
  }

  @override
  void dispose() {
    _itemsContexts.clear();
    _streamController.close();
    super.dispose();
  }

  void _onScroll(List<ScrollNotification> notifications) {
    // Iterate through each item to check
    // whether it is in the viewport

    for (var item in _itemsContexts) {
      // Make sure the context is still mounted
      if (item.context.mounted == false) {
        continue;
      }

      // Retrieve the RenderObject, linked to a specific item
      final RenderObject? object = item.context.findRenderObject();

      log('Ovner: ${item.id}'); //index

      // If none was to be found, or if not attached, leave by now
      // As we are dealing with Slivers, items no longer part of the
      // viewport will be detached
      if (object == null || !object.attached) {
        continue;
      }

      // Retrieve the viewport related to the scroll area
      final RenderAbstractViewport viewport = RenderAbstractViewport.of(object);
      final double vpHeight = viewport.paintBounds.height; //300

      final ScrollableState scrollableState = Scrollable.of(item.context);
      final ScrollPosition scrollPosition = scrollableState.position;

     
      final RevealedOffset vpOffset = viewport.getOffsetToReveal(object, 0.0);

       log('vpOffset: ${vpOffset}');
       //В данном контексте, смещение ( offset ) относительно видимой 
       //области для отображения объекта ( object ) указывает на то, 
       //насколько нужно сдвинуть видимую область прокрутки, 
       //чтобы объект был полностью видимым на экране

      // Retrieve the dimensions of the item
      final Size size = object.semanticBounds.size;

      // Check if the item is in the viewport
      final double deltaTop = vpOffset.offset - scrollPosition.pixels;
      final double deltaBottom = deltaTop + size.height;

      bool isInViewport = false;

      isInViewport = (deltaTop >= 0.0 && deltaTop < vpHeight);
      if (!isInViewport) {
        isInViewport = (deltaBottom > 0.0 && deltaBottom < vpHeight);
      }

      debugPrint(
          '${item.id} --> offset: ${vpOffset.offset} -- VP?: $isInViewport');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test in Viewport'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SizedBox(
          width: 200.0,
          height: 300.0,
          child: Container(
            color: Colors.yellow,
            //
            // We are listening to notifications, emitted by
            // the Scrollable
            //
            child: NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification scroll) {
                // Make sure the page is not in an unstable state
                if (!_streamController.isClosed) {
                  _streamController.add(scroll);
                }

                return true;
              },
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return _buildItem(index);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  //
  // Little trick:  We use a LayoutBuilder to get the context of a certain item
  // so that we can save it for later re-use (at ScrollNotification)
  //
  Widget _buildItem(int index) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        //
        // Record the couple: BuildContext, item index
        //
        _itemsContexts.add(ItemContext(
          context: context,
          id: index,
        ));

        return ListViewItem(itemIndex: index);
      },
    );
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
          child:
              Text('$itemIndex', style: const TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
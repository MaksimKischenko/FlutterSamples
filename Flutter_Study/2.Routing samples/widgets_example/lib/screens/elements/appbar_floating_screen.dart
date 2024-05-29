import 'package:flutter/material.dart';

class AppFloating extends StatelessWidget {
  static String routeName = '/_elementsDemos/09_appBarFloating';

  @override
  Widget build(BuildContext context) {
    final title = 'Floating App Bar';
    return Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Text(title),
              floating: true,
              expandedHeight: 200,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => ListTile(title: Text('Item #$index')),
                childCount: 1000,
              ),
            ),
          ],
        ),
    );
  }
}

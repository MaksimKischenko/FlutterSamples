import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyPageViewScreen extends StatelessWidget {
  const MyPageViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(initialPage: 0);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Example')),
        body: PageView(
          /// [PageView.scrollDirection] defaults to [Axis.horizontal].
          /// Use [Axis.vertical] to scroll vertically.
          scrollDirection: Axis.horizontal,
          allowImplicitScrolling: true,
          controller: controller,
          children: const <Widget>[
            Center(
              child: Text(
                'First Page',
                style: TextStyle(color: Colors.black, fontSize: 24),
              ),
            ),
            Center(
              child: Text(
                'Second Page',
                style: TextStyle(color: Colors.black, fontSize: 24),
              ),
            ),
            Center(
              child: Text(
                'Third Page',
                style: TextStyle(color: Colors.black, fontSize: 24),
              ),
            )
          ],
        ),
      ),
    );
  }
}

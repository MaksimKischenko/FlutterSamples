
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WidgetMeasurements(),
    );
}

class WidgetMeasurements extends StatefulWidget {
  const WidgetMeasurements({super.key});

  @override
  State<WidgetMeasurements> createState() => _WidgetMeasurementsState();
}

class _WidgetMeasurementsState extends State<WidgetMeasurements> {
  ///[GlobalKey] uniquely identifies the widget in the render tree as RenderBox.
  ///we need to attach this key to the widget whose information we need for our use.
  final GlobalKey textKey = GlobalKey();
  Size size = const Size(0, 0);
  Offset offset = const Offset(0, 0);

  @override
  void initState() {
    super.initState();
    getDimensions();
  }

  void getDimensions() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getSizeAndPosition();
    });
  }

 void getSizeAndPosition() {

    ///The line [RenderBox logoBox = textKey.currentContext!.findRenderObject() as RenderBox]; 
    ///retrieves the RenderBox associated with a specific widget. 
    ///It uses the findRenderObject() method to find the associated RenderBox object.
    final logoBox = textKey.currentContext?.findRenderObject() as RenderBox;
    size = logoBox.size;
    offset = logoBox.localToGlobal(Offset.zero);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            key: textKey,
            'Flutter is awesome',
            style: const TextStyle(fontSize: 20),
          ),
          Container(
            height: size.height,
            width: size.width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                stops: [0.1, 0.5, 0.7, 0.9],
                colors: [
                  Colors.red,
                  Colors.orange,
                  Colors.yellow,
                  Colors.green
                ],
              ),
            ),
            child: const Text(
              'Flutter is awesome',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Container(
            alignment: Alignment.center,
            color: Colors.black,
            child: Text(
              'Height = ${size.height} && Width = ${size.width} && Position is $offset',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
}
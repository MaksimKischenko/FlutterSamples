import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  CounterScreen({Key? key}) : super(key: key);
  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int value = 0;
  Future<String>? _future;

  @override
  void initState() {
    super.initState();
    _future = Future.delayed(Duration(seconds: 3), () => "Hello");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 100),
          Center(
            child: ElevatedButton(
                child: Text("Value: $value", style: TextStyle(fontSize: 22)),
                onPressed: () {
                  setState(() {
                    value++;
                  });
                }),
          ),
          FutureBuilder<String>(
            future: _future,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!);
              } else {
                return Text("No data");
              }
            },
          )
        ],
      ),
    );
  }
}

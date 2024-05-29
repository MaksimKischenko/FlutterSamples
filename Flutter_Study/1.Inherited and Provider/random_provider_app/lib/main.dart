import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_provider_app/provider/counter.dart';
import 'package:random_provider_app/provider/counter_state.dart';

void main() {
  runApp(NotifyApp());
}

class NotifyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) => MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> CounterState())
      ],
      child: MaterialApp(
        title: 'Provider example',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity
        ),
        home: const HomeNotifyPage(),
      ),
      
    );
}

class HomeNotifyPage extends StatefulWidget {

  final String? title;

  const HomeNotifyPage({
    Key? key,
    this.title,
  }) : super(key: key);

  @override
  _HomeNotifyPageState createState() => _HomeNotifyPageState();
}

class _HomeNotifyPageState extends State<HomeNotifyPage> {
  @override
  Widget build(BuildContext context) {

    final counterState = Provider.of<CounterState>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title ?? ''),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Random value'),
            Consumer<CounterState>(builder: (BuildContext context, CounterState counterState, Widget? child) 
              => Counter(counterState.value))
          ], 
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: counterState.randomizeCounter,
        tooltip: 'Randomize',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
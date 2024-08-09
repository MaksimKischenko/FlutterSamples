import 'package:flutter/material.dart';
import 'package:mvvm_arch_app/ui/models/home/home_view_model.dart';
// ignore: unused_import
import 'package:mvvm_arch_app/ui/models/notifier_builder.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  late final HomeViewModel _viewModel;
  @override
  void initState() {
    super.initState();
    _viewModel = HomeViewModel()
    ..initState();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierBuilder(
        notifier: _viewModel,
        builder: (context, homeViewModel)=> Scaffold(
            body: SafeArea(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                     Text('ARGS: ${_viewModel.value.args}'),
                     ElevatedButton(
                      onPressed: () {
                       _viewModel.addArg('second');
                     }, 
                     child: const Text('Add')
                    )
                  ],
                ),
              ),
            )
          ),
      ),
    );
  }
}



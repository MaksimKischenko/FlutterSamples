import 'package:flutter/material.dart';
import 'package:mvvm_arch_app/ui/models/notifier_builder.dart';

import 'package:mvvm_arch_app/ui/models/view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  late final ViewModel _viewModel;
  @override
  void initState() {
    _viewModel = ViewModel();
    super.initState();
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
        builder: (context, snapshot) {
          return Scaffold(
            body: SafeArea(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(_viewModel.state.ageTitle),
                    ElevatedButton(
                      onPressed: ()  {
                        _viewModel.onIncrementButtonPressed();
                      }, 
                      child: const Text('+')
                    ),
                    ElevatedButton(
                      onPressed: ()  {
                        _viewModel.onDecremenButtonPressed();
                      }, 
                      child: const Text('-')
                    )     
                  ],
                ),
              ),
            )
          );
        },
      ),
    );
  }
}



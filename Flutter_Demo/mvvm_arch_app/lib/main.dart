import 'package:flutter/material.dart';
import 'package:mvvm_arch_app/ui/models/view_model.dart';
import 'package:mvvm_arch_app/ui/widgets/widgets.dart';
import 'package:provider/provider.dart';

import 'ui/widgets/bad_example_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
        create: (_) => ViewModel(),
        child: const GoodExampleWidget()
      ),
    );
  }
}





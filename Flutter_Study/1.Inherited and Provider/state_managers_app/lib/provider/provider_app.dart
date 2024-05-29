import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_managers_app/provider/view_models/age_view_model.dart';

import 'views/main_view.dart';

class AppProvider extends StatelessWidget {
  const AppProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AppProvider',
      theme: ThemeData(
        useMaterial3: true
      ),
      home: ChangeNotifierProvider(
        create: (_) => AgeViewModel(),
        child: const MainView()
      ),
    );
  }
}

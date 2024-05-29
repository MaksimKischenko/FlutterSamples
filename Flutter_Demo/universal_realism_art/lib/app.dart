import 'package:universal_realism_art/presentation/routes.dart';
import 'package:universal_realism_art/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'presentation/bloc/bloc.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => BlocBuilder<ThemeBloc, ThemeState>(
    builder: (context, state) => MaterialApp.router(
        routerConfig: router, 
        theme: state.isLight? 
          AppThemes.ligthTheme: 
          AppThemes.darkTheme
      ),
  );
}

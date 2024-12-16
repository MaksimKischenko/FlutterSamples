import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:optimal_prime/generated/translations.g.dart';
import 'package:optimal_prime/routes.dart';

import 'presentation/bloc/theme/theme_cubit.dart';
import 'utils/theme.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) => BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) => MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: router,
          locale: TranslationProvider.of(context).flutterLocale,
          theme: state.isLight ? AppTheme.light(context) : AppTheme.light(context),
        ),
      );
}


import 'package:universal_realism_art/presentation/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class AppWrapper extends StatelessWidget {
  final Widget child;
  const AppWrapper({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
    providers: [       
      BlocProvider<ThemeBloc>(
        create: (context) => ThemeBloc()..add(ThemeChange()),
      ), 
      BlocProvider<MenuBloc>(
        create: (context) => MenuBloc(),
      ),                                                    
    ],
    child: child
  ); 
}


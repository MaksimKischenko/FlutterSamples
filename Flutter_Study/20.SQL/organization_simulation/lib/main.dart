
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organization_simulation/bloc/bloc.dart';
import 'package:organization_simulation/bloc/bloc_observer.dart';
import 'package:organization_simulation/bloc/manager_add/manager_add_bloc.dart';
import 'package:organization_simulation/route_helper.dart';
import 'package:organization_simulation/screens/screens.dart';
import 'config.dart';
import 'navigation.dart';
import 'styles.dart';



void main() {
  Bloc.observer = SimpleBlocObserver();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<AuthBloc>(
      create: (context) => AuthBloc()..add(AuthInit()),
    ),
  ],
    child: OrganizationSimulatorApp()
 ));
}

class OrganizationSimulatorApp extends StatelessWidget {

  static const primary = MaterialColor(4283157653, {
    50: Color(0xffebf9f3),
    100: Color(0xffd7f4e8),
    200: Color(0xffb0e8d0),
    300: Color(0xff88ddb9),
    400: Color(0xff60d2a1),
    500: Color(0xff38c78a),
    600: Color(0xff2d9f6e),
    700: Color(0xff227753),
    800: Color(0xff174f37),
    900: Color(0xff0b281c)
  });

  @override
  Widget build(BuildContext context) =>MaterialApp(
      initialRoute: '/manager',
      onGenerateRoute: (settings ) {

        final parsed = RouteHelper.parsePath(settings.name ?? '', isHashStrategy: false);
        final path = parsed.key;
        final params = parsed.value;
        print(params);

        Widget Function(BuildContext)? builder;

        if (path == '/') {
        builder = (context) => SplashScreen();
        } else if (path == '/auth') {
        builder = (context) => AuthScreen();
        } else if (path =='/manager') {
          builder = (context) =>BlocProvider<ComonStatisticBloc>(
            create: (context) =>ComonStatisticBloc()..add(ComonStatisticInit()),
            child: ManagerScreen()
          );  
        } else if (path =='/employee') {
          builder = (context) => EmployeeScreen();
        } else if (path =='/frealancer') {
          builder = (context) => FreaLancerScreen();
        } else if (path =='/manager/add') {
          builder = (context) => BlocProvider<ManagerAddBloc>(
            create: (context)=>ManagerAddBloc()..add(ManagerAddInit()),
            child: ManagerAddScreen()
          );  
        } else if (path =='/employee/add') {
          builder = (context) => BlocProvider<EmployeeAddBloc>(
            create: (context)=>EmployeeAddBloc()..add(EmployeeAddInit()),
            child: EmployeeAddScreen()
          );  
        } else if (path =='/frealancer/add') {
          builder = (context) => BlocProvider<FrealancerAddBloc>(
            create: (context)=>FrealancerAddBloc()..add(FrealancerAddInit()),
            child: FreaLancerAddScreen()
          );  
        }

        builder ??= (context) => SplashScreen();

        return MaterialPageRoute(
          settings: settings,
          builder: builder);
       },
       
       navigatorKey: Navigation.navigatorKey,
       title: 'Loading | ${AppConfig.appName}',
       theme: ThemeData(
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: AppStyles.scaffoldColor,
        appBarTheme: AppBarTheme(
          color: AppStyles.scaffoldColor,
          brightness: Brightness.light,
          elevation: 0,
          iconTheme: Theme.of(context)
              .primaryIconTheme
              .copyWith(color: AppStyles.mainTextColor),
        ),
        primarySwatch: primary,
        secondaryHeaderColor: Colors.black,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      )
    );
}
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:untitled1/blocs/bloc_observer.dart';
import 'package:untitled1/blocs/taxi_confirm/taxi_confirm_bloc.dart';
import 'package:untitled1/injection_component.dart';
import 'package:untitled1/screens/animo/flutter_logo.dart';

import 'package:untitled1/screens/screens.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/blocs/blocs.dart';
import 'package:untitled1/screens_proj_test/screens.dart';

import 'blocs/blocs.dart';
import 'screens/note/note_screen.dart';
import 'screens/test_context_widget.dart';
import 'screens_proj_test/postman/bloc/postman_bloc.dart';
import 'screens_proj_test/screens/postman_screen.dart';

void main() {
  // // final WeatherRepository weatherRepository = WeatherRepository(
  // //   weatherApiClient: WeatherService(
  // //     httpClient: http.Client(),
  //   ),
  // );
  Bloc.observer = SimpleBlocObserver();
  InjectionComponent.run();
  // runApp(
  //   BlocProvider<ThemeBloc>(
  //     create: (context) => ThemeBloc(),
  //     child: App(weatherRepository: weatherRepository),
  //   ),
  // );

  // runApp(
  //     BlocProvider<AuthBloc>(create: (context) => AuthBloc(), child: MyApp()));

  // runApp(
  //     BlocProvider<NotesBloc>(create: (context) => NotesBloc(), child: MyApp()));

  runApp(MultiBlocProvider(providers: [
    BlocProvider<TaxiConfirmBloc>(create: (context) => TaxiConfirmBloc()),
  ], child: MyApp()));

  // //runApp(SendDataScreenApp());
  // // runApp(NetworkingAppJsonScreen());
}

// void main() => runApp(const MyAppLottie());

// class MyAppLottie extends StatelessWidget {
//   const MyAppLottie({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: ListView(
//           children: [
//             // Load a Lottie file from your assets

//             // Load a Lottie file from a remote url
//             Lottie.network(
//                 'https://raw.githubusercontent.com/xvrh/lottie-flutter/master/example/assets/Mobilo/A.json'),

//             // Load an animation and its images from a zip file
//           ],
//         ),
//       ),
//     );
//   }
// }

// class App extends StatelessWidget {
//   final WeatherRepository weatherRepository;

//   App({Key? key, required this.weatherRepository}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<ThemeBloc, ThemeState>(
//       builder: (context, themeState) {
//         return MaterialApp(
//           title: 'Flutter Weather',
//           routes: {},
//           theme: themeState.theme,
//           home: BlocProvider(
//             create: (context) =>
//                 WeatherBloc(weatherRepository: weatherRepository),
//             child: WeatherScreen(),
//           ),
//         );
//       },
//     );
//   }

//  class MyAppCupertino

// class MyAppCupertino extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return CupertinoApp(
//         localizationsDelegates: [
//           DefaultMaterialLocalizations.delegate,
//           DefaultCupertinoLocalizations.delegate,
//           DefaultWidgetsLocalizations.delegate,
//         ],
//         theme: CupertinoThemeData(
//           barBackgroundColor: Color(0xffFFFFFF),
//         ),
//         home:
//             //FilesRecentScreen(),
//             //FilesFoldersScreen()
//             //FilesSharedScreen()
//             FilesSettingsScreen());
//   }
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          fontFamily: 'Roboto',
          scaffoldBackgroundColor: Color(0xffFFFFFF),
          appBarTheme: AppBarTheme(
              color: Colors.white,
              brightness: Brightness.light,
              elevation: 0,
              iconTheme: Theme.of(context)
                  .primaryIconTheme
                  .copyWith(color: Colors.black)),
          primarySwatch: Colors.green,
          secondaryHeaderColor: Colors.black,
          textTheme: Theme.of(context).textTheme.apply(bodyColor: Colors.black),
          primaryTextTheme:
              Theme.of(context).primaryTextTheme.apply(bodyColor: Colors.black),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home:

            //PhysicsCardDragDemo()//
            SportLivescoreScreen()
        //SortTablePage()
        //TaxiVerifyScreen(),  ------FocusNode
        //TaxiRouteScreen()    ------ReachText
        //TaxiFeedbackScreen() ------Positioned Stack + onTap()
        //FilesRecentScreen(), ------Custom BottonBar
        //SportLivescoreScreen() ------UI example
        //MyAppFloating(),      ------SliverList Example

        );
  }
}

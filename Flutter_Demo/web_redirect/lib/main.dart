import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

// ignore: unused_import
import 'screens/screens.dart';



void main() {
  runApp(MobileBookApp());
  // String yourToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoid2ViX3VzZXIiLCJhcHBfdXNlciI6InJvb3QiLCJhcHBfdHlwZSI6IjEiLCJhcHBfdXNlcl90eXBlX2lkIjoxLCJleHAiOjE2NDMzMjAxNDZ9.B3ssYumhfo4x2Peypq_WMREVzTwNw2gzrTapHrmJ2bg";
  // Map<String, dynamic> decodedToken = JwtDecoder.decode(yourToken);
  // print(decodedToken);


}


class MobileBookApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xffFFFFFF),
          appBarTheme: AppBarTheme(
              color: Colors.white,
              elevation: 0,
              iconTheme: Theme.of(context)
                  .primaryIconTheme
                  .copyWith(color: Colors.red)),
          primarySwatch: Colors.green,
          secondaryHeaderColor: Colors.red,
          textTheme: Theme.of(context).textTheme.apply(bodyColor: Colors.red),
          primaryTextTheme:
              Theme.of(context).primaryTextTheme.apply(bodyColor: Colors.red),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const OpenView());
  }
}

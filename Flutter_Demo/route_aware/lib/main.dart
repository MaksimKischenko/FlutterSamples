
import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:route_aware/splash.dart';
import 'second_page.dart';


final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();
late Timer timer;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     navigatorObservers: [routeObserver],
     debugShowCheckedModeBanner: false, 
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Splash(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with RouteAware{

 
  @override
  void didChangeDependencies() {
    routeObserver.subscribe(this, ModalRoute.of(context) as PageRoute);
    super.didChangeDependencies();
  }

  @override
  void initState() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      log('TIC${timer.tick}');
     });
    super.initState();

  }


  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPush() {}

  @override
  void didPopNext() {
    print('didPopNext');
  
    super.didPopNext();
  }

  @override
  void didPushNext() {
    print('didPushNext');
    timer.cancel();
    super.didPushNext();
  }  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        automaticallyImplyLeading: false,
        title: const Text('Flutter RouteAware Demo'),
      ),
      body: Center(
        child:Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const FlutterLogo(),
              SizedBox(height: MediaQuery.of(context).size.height*0.25,),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    textStyle: TextStyle(fontSize: 20),
                    minimumSize: Size.fromHeight(40),
                    primary: Colors.cyan,
                  ),
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => SecondPage(),
                    ),
                  ),
                  child: Text("Home Page",)
              ),
            ],
          ),
        ),
      ),
    );
  }
}
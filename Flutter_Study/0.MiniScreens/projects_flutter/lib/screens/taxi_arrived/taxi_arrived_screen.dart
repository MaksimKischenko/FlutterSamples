import 'package:flutter/material.dart';
import 'package:untitled1/screens/taxi_arrived/widget/widget.dart';

class TaxiArrivedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Arrived',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
        centerTitle: true,
        leading: IconButton(
            icon: Container(
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.2), blurRadius: 8),
                    ]),
                child: Icon(Icons.menu)),
            onPressed: () {}),
      ),
      body: Stack(
        children: [
          Image.asset(
            'assets/map.png',
            width: double.maxFinite,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
            child: Align(child: ArrivedMenu(), alignment: Alignment.topCenter),
          ),
          Align(
            alignment: Alignment.center,
            child: LocationPointer(),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: DriverInfo(),
          )
        ],
      ),
    );
  }
}

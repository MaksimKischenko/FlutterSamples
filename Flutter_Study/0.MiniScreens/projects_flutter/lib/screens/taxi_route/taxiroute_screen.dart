import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'widgets/widgets.dart';

class TaxiRouteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text('Ride options',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.black54)),
          centerTitle: true,
          leading: IconButton(
              icon: Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 6),
                      ]),
                  child: Icon(Icons.arrow_back_ios)),
              onPressed: () {})),
      body: Stack(
        children: [
          Image.asset(
            'assets/map.png',
            width: double.maxFinite,
            fit: BoxFit.cover,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 140),
              child: SvgPicture.asset('assets/route.svg'),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: BookRideMenu(
              minutes: 24,
            ),
          )
        ],
      ),
    );
  }
}

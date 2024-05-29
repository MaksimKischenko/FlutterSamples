import 'package:flutter/material.dart';

import 'widgets/widgets.dart';

class TaxiScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, //!!
      appBar: AppBar(
        backgroundColor: Colors.transparent,
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
          Align(alignment: Alignment.topCenter, child: StreetField()),
          Align(
              alignment: Alignment.center, child: LocationPointer(minutes: 10)),
          Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: EdgeInsets.symmetric(
                        horizontal: 8, vertical: 22), //! heigth???
                    minWidth: double.maxFinite,
                    onPressed: () {},
                    color: Theme.of(context).primaryColor,
                    child: Text('Next',
                        style: TextStyle(color: Colors.white, fontSize: 18))),
              )),
        ],
      ),
    );
  }
}

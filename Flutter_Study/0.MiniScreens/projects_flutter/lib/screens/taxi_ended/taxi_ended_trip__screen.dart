import 'package:flutter/material.dart';

import 'widget/widget.dart';

class TaxiEndedTripScreen extends StatelessWidget {
  final sum = 7.63;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
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
                child: Icon(
                  Icons.menu,
                  color: Colors.black,
                )),
            onPressed: () {}),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 60),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.2), blurRadius: 8),
                  ],
                ),
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Center(
                      child: Container(
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.done,
                          color: Colors.blue,
                          size: 65,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'You trip has ended',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TripInfo(),
                    ),
                    SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: PaymentInfo(sum: 7.63),
                    )
                  ],
                ),
              ),
            ),
            MaterialButton(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 18),
                minWidth: double.maxFinite,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                onPressed: () {},
                color: Colors.blue,
                child: Text('OK',
                    style: TextStyle(color: Colors.white, fontSize: 18))),
            SizedBox(
              height: 24,
            )
          ],
        ),
      ),
    );
  }
}

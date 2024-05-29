import 'package:flutter/material.dart';

import 'widget.dart';

class DriverInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topRight: Radius.circular(38))),
            child: Padding(
              padding: EdgeInsets.fromLTRB(24, 54, 24, 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text('Patrick',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w700)),
                      ),
                      Spacer(),
                      AutoInfo(
                        number: 'HS785K',
                        model: 'Volkswagen Jetta',
                      )
                    ],
                  ),
                  SizedBox(height: 46),
                  Row(
                    children: [
                      Expanded(
                        child: MaterialButton(
                            padding: EdgeInsets.symmetric(
                                horizontal: 24, vertical: 18),
                            minWidth: double.maxFinite,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            onPressed: () {},
                            color: Colors.blue,
                            child: Text('Contact driver',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18))),
                      ),
                      SizedBox(width: 10),
                      MaterialButton(
                          padding: EdgeInsets.symmetric(
                              horizontal: 18, vertical: 18),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          minWidth: 50,
                          onPressed: () {},
                          color: Colors.white,
                          child: Icon(Icons.close))
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: -45,
            child: Container(
              padding: EdgeInsets.all(12),
              decoration:
                  BoxDecoration(color: Colors.white, shape: BoxShape.circle),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(38),
                child: Image.asset(
                  'assets/avatar.jpg',
                  width: 70,
                  height: 70,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

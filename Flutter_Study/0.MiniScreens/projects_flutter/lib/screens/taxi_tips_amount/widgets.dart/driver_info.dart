import 'package:flutter/material.dart';

import 'widgets.dart';

class DriverInfo extends StatefulWidget {
  @override
  _DriverInfoState createState() => _DriverInfoState();
}

class _DriverInfoState extends State<DriverInfo> {
  int? _tip;

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
              padding: EdgeInsets.fromLTRB(0, 54, 0, 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 4),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text('Patrick',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w700)),
                  ),
                  SizedBox(height: 34),
                  Tippings(
                      value: _tip,
                      onTap: (value) {
                        setState(() {
                          _tip = value;
                        });
                  }),
                  SizedBox(height: 31),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                        'Tipping is welcome, but not required. \nThe amount is always up to you.',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400)),
                  ),
                  SizedBox(height: 32),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: MaterialButton(
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 18),
                        minWidth: double.maxFinite,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        onPressed: () {},
                        color: Colors.blue,
                        child: Text('Submit',
                            style:
                                TextStyle(color: Colors.white, fontSize: 18))),
                  )
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

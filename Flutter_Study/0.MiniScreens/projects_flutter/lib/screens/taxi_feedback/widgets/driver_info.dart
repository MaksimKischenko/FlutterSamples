import 'package:flutter/material.dart';

import 'widgets.dart';

class DriverInfo extends StatefulWidget {
  @override
  _DriverInfoState createState() => _DriverInfoState();
}

class _DriverInfoState extends State<DriverInfo> {
  int? _stars;
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
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 4),
                  Text('Patrick',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w700)),
                  Stars(
                      value: _stars,
                      onTap: (value) {
                        setState(() {
                          _stars = value;
                        });
                      }),
                  TextFormField(
                    // initialValue:
                    //     'Where are youeererererererererererererererererer',
                    minLines: 5,
                    maxLines: 5,
                    showCursor: false,
                    decoration: InputDecoration(
                      filled: true,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(16)),
                      fillColor: Color(0xffD5DDE0),
                      hintText: 'Message',
                      isDense: true,
                    ),
                  ),
                  SizedBox(height: 32),
                  MaterialButton(
                      padding:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 18),
                      minWidth: double.maxFinite,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      onPressed: () {},
                      color: Colors.blue,
                      child: Text('Rate',
                          style: TextStyle(color: Colors.white, fontSize: 18)))
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

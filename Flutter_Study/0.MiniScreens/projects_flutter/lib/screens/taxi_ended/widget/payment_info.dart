import 'dart:math';

import 'package:flutter/material.dart';

class PaymentInfo extends StatelessWidget {
  final double sum;

  const PaymentInfo({required this.sum});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: [
          Image.asset('assets/clear.png', width: 15),
          SizedBox(width: 16),
          Expanded(
            child: Text(
              '**** 8295',
              style: TextStyle(color: Color(0xff3E4958)),
            ),
          ),
          SizedBox(width: 8),
          RichText(
              text: TextSpan(
                  style: TextStyle(
                    color: Color(0xff3E4958),
                    fontWeight: FontWeight.w800,
                  ),
                  children: [
                WidgetSpan(
                    alignment: PlaceholderAlignment.top,
                    child: Text(
                      '\$',
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    )),
                TextSpan(
                    text: '${sum.floor()}', style: TextStyle(fontSize: 18)),
                WidgetSpan(
                    alignment: PlaceholderAlignment.top,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 2),
                      child: Text(
                        '${((sum % 1).roundFixed() * 100).floor()}',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    )),
              ]))
        ],
      ),
    );
  }
}

extension DoubleExtension on double {
  double roundFixed() {
    num mod = pow(10.0, 2);
    return ((this * mod).round().toDouble() / mod);
  }
}

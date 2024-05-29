import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialAuth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                color: Colors.grey.shade300,
                height: 3,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 9),
              child: Text('OR SIGN IN WITH',
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 13,
                      fontWeight: FontWeight.w700)),
            ),
            Expanded(
              child: Container(
                color: Colors.grey.shade300,
                height: 3,
              ),
            )
          ],
        ),
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/icon/facebook.svg'),
            SizedBox(width: 30),
            SvgPicture.asset('assets/icon/twitter.svg'),
            SizedBox(width: 30),
            SvgPicture.asset('assets/icon/gmail.svg')
          ],
        ),
      ],
    );
  }
}

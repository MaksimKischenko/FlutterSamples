import 'package:flutter/material.dart';

class SignItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MaterialButton(
            onPressed: () {},
            padding: EdgeInsets.symmetric(horizontal: 72, vertical: 20),
            child: Text('Sign in',
                style: TextStyle(color: Colors.white, fontSize: 16)),
            color: Color(0xff246BFD),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            )),
        SizedBox(width: 16),
        Expanded(
          child: TextButton(
              onPressed: () {},
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(vertical: 18))),
              child: Text('Sign Up',
                  style: TextStyle(color: Color(0xffC4C4C4), fontSize: 18))),
        )
      ],
    );
  }
}

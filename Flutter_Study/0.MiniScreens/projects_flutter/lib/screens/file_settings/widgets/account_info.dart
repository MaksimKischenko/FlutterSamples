import 'package:flutter/material.dart';

class AccountInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Change Email',
                  style: TextStyle(
                    color: Color(0xff39434C).withOpacity(0.7),
                    fontSize: 15,
                  )),
              Icon(Icons.arrow_forward_ios, color: Color(0xffE5E5E5))
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Change Password',
                  style: TextStyle(
                    color: Color(0xff39434C).withOpacity(0.7),
                    fontSize: 15,
                  )),
              Icon(Icons.arrow_forward_ios, color: Color(0xffE5E5E5))
            ],
          )
        ],
      ),
    );
  }
}

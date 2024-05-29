import 'package:flutter/material.dart';

class PersonalInfo extends StatelessWidget {
  final String name;
  final String userName;
  const PersonalInfo({
    Key? key,
    required this.name,
    required this.userName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Image.asset('assets/Avatar.png'),
          SizedBox(width: 16),
          Expanded(
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    Expanded(
                      child: Text('Name',
                          style: TextStyle(
                              color: Color(0xff39434C).withOpacity(0.7),
                              fontSize: 15,
                              fontWeight: FontWeight.w400)),
                    ),
                    Text(name,
                        style: TextStyle(
                          color: Color(0xff47A7FF),
                          fontSize: 16,
                        ))
                  ]),
                  Divider(),
                  Row(children: [
                    Expanded(
                      child: Text('UserName',
                          style: TextStyle(
                              color: Color(0xff39434C).withOpacity(0.7),
                              fontSize: 15,
                              fontWeight: FontWeight.w400)),
                    ),
                    Text(userName,
                        style: TextStyle(
                          color: Color(0xff47A7FF),
                          fontSize: 16,
                        ))
                  ])

                  // RichText(
                  //     text: TextSpan(
                  //         text: 'Name',
                  //         style: TextStyle(
                  //             color: Color(0xff39434C).withOpacity(0.7),
                  //             fontSize: 15,
                  //             fontWeight: FontWeight.w400),
                  //         children: [
                  //       TextSpan(
                  //           text: name,
                  //           style: TextStyle(
                  //             color: Color(0xff47A7FF),
                  //             fontSize: 16,
                  //           ))
                  //     ])),

                  // RichText(
                  //     text: TextSpan(
                  //         text: 'UserName',
                  //         style: TextStyle(
                  //             color: Color(0xff39434C).withOpacity(0.7),
                  //             fontSize: 15,
                  //             fontWeight: FontWeight.w400),
                  //         children: [
                  //       TextSpan(
                  //           text: userName,
                  //           style: TextStyle(
                  //             color: Color(0xff47A7FF),
                  //             fontSize: 16,
                  //           ))
                  //     ]))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

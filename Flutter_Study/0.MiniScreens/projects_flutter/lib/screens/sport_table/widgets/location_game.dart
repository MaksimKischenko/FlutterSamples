import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LocationGame extends StatelessWidget {
  final Function(int? item) onTap;
  final int? value;

  List<String> games = [
    'All',
    'Home',
    'Away',
  ];

  LocationGame({
    Key? key,
    required this.onTap,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => GestureDetector(
              behavior: HitTestBehavior.translucent,
              child: Container(
                padding: EdgeInsets.all(14),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(23),
                    gradient: index == value
                        ? LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                                Color(0xffED6B4E),
                                Color(0xffF4A58A),
                              ])
                        : null,
                    color: index == value ? null : Color(0xff181829)),
                child: Text('${games[index]}',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600)),
              ),
              onTap: () => onTap(index == value ? null : index)),
          separatorBuilder: (context, index) => SizedBox(width: 10),
          itemCount: 3),
    );
  }
}

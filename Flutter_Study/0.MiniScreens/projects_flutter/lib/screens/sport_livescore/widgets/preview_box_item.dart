import 'package:flutter/material.dart';

class PreviewBoxItem extends StatelessWidget {
  final String sportName;
  final String title;
  final String time;
  const PreviewBoxItem({
    Key? key,
    required this.sportName,
    required this.title,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.fromLTRB(20, 20, 0, 10),
        decoration: BoxDecoration(
          // borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xff246BFD),
                Color(0xff0C0C69),
              ]),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    padding: EdgeInsets.symmetric(vertical: 4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(width: 8),
                        Image.asset('assets/soccer.png', height: 22),
                        SizedBox(width: 4),
                        Text(sportName,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w600)),
                        SizedBox(width: 8),
                      ],
                    )),
                SizedBox(height: 8),
                Text(title,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600)),
                SizedBox(height: 10),
                Text(time,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400))
              ],
            ),
            Positioned(
              bottom: -32,
              right: -25,
              child: Image.asset('assets/Carrager.png', height: 220),
            )
          ],
        ),
      ),
    );
  }
}

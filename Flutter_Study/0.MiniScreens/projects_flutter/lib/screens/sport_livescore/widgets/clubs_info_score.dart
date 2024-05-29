import 'package:flutter/material.dart';
import 'package:untitled1/models/models.dart';

class ClubsInfoItem extends StatelessWidget {
  final List<ClubInfoMatch> scoreInfo;
  const ClubsInfoItem({
    Key? key,
    required this.scoreInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(7),
          decoration: BoxDecoration(
            color: Color(0xff222232),
            shape: BoxShape.circle,
          ),
          child: Image.asset('assets/${scoreInfo[0].firstClubImagePath}',
              height: 20),
        ),
        Container(
          padding: EdgeInsets.all(7),
          decoration: BoxDecoration(
            color: Color(0xff222232),
            shape: BoxShape.circle,
          ),
          child: Image.asset('assets/${scoreInfo[1].firstClubImagePath}',
              height: 20),
        ),
        SizedBox(width: 14),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(scoreInfo[0].firstClubName,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600)),
            Text(scoreInfo[0].firstClubName,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600)),
          ],
        ),
        Text(' vs \n   -',
            style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600)),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(scoreInfo[1].firstClubName,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600)),
            Text(scoreInfo[1].secondClubName,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600)),
          ],
        )
      ],
    );
  }
}

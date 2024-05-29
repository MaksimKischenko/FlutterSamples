import 'package:flutter/material.dart';
import 'package:untitled1/models/models.dart';

class MatchItem extends StatelessWidget {
  final ClubInfoMatch item;

  const MatchItem(this.item);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: EdgeInsets.only(left: 16),
        decoration: BoxDecoration(
          color: Color(0xff2B2B3D),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Color(0xff222232),
                shape: BoxShape.circle,
              ),
              child:
                  Image.asset('assets/${item.firstClubImagePath}', height: 20),
            ),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Color(0xff222232),
                shape: BoxShape.circle,
              ),
              child:
                  Image.asset('assets/${item.secondClubImagePath}', height: 20),
            ),
            SizedBox(width: 8),
            Expanded(
              child: DefaultTextStyle(
                style: TextStyle(color: Colors.white),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text(item.firstClubName),
                          Text('${item.firstScoreNum}')
                        ],
                      ),
                    ),
                    SizedBox(width: 4),
                    Column(
                      children: [Text('vs'), Text('-')],
                    ),
                    SizedBox(width: 4),
                    Expanded(
                      child: Column(
                        children: [
                          Text(item.secondClubName),
                          Text('${item.secondScoreNum}')
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(width: 8),
            Container(
              // width: 30,
              height: 60,
              padding: EdgeInsets.symmetric(horizontal: 16),
              color: Color(0xff222232),
              child: Text(
                'HT',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}

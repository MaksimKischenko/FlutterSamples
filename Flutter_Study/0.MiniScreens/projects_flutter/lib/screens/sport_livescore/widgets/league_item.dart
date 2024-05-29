import 'package:flutter/material.dart';
import 'package:untitled1/models/models.dart';

import 'score_box_item.dart';
import 'widgets.dart';

class LeagueItem extends StatelessWidget {
  final LeagueInfo item;

  const LeagueItem(this.item);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(item.leagueName,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600)),
                  SizedBox(height: 4),
                  Text(item.country,
                      style: TextStyle(
                          color: Color(0xffAAAAAA),
                          fontSize: 12,
                          fontWeight: FontWeight.w400))
                ],
              ),
              Spacer(),
              Icon(Icons.chevron_right, color: Colors.white)
            ],
          ),
          ListView.separated(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(vertical: 16),
            physics: NeverScrollableScrollPhysics(),
            itemCount: item.matches.length,
            itemBuilder: (context, index) => MatchItem(item.matches[index]),
            separatorBuilder: (context, _) => SizedBox(height: 8),
          )
        ],
      ),
    );
  }
}

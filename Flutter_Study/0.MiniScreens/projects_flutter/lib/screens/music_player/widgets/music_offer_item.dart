import 'package:flutter/material.dart';
import 'package:untitled1/models/models.dart';

class MusicOfferItem extends StatelessWidget {
  final MusicOffer item;

  const MusicOfferItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: item.color,
          ),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 14),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/${item.avatar}'),
              SizedBox(width: 16),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.singer,
                    style: TextStyle(
                        // height: 1.1,
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        color: Colors.black),
                    maxLines: 1,
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 18,
                        height: 18,
                        decoration: BoxDecoration(
                          color: Color(0xff9570FF),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.music_note,
                          size: 8,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        item.song,
                        style: TextStyle(
                            color: Color(0xff828282),
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                        maxLines: 1,
                      )
                    ],
                  )
                ],
              ),
              SizedBox(width: 16),
            ],
          ),
        ),
        Positioned(
          right: -13,
          bottom: 0,
          child: Align(
            alignment: Alignment.bottomRight,
            child: Container(
              width: 26,
              height: 26,
              decoration: BoxDecoration(
                color: Color(0xff333333),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.play_arrow,
                size: 14,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

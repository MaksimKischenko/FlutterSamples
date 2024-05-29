import 'package:flutter/material.dart';

import 'package:untitled1/models/models.dart';

class SportItem extends StatelessWidget {
  final SportInfo item;
  final bool selected;
  final Function(SportInfo item) onTap;

  const SportItem(
      {Key? key,
      required this.item,
      required this.selected,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => onTap(item),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: selected
                  ? LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                          Color(0xffF4A58A),
                          Color(0xffED6B4E),
                        ])
                  : null,
              color: selected ? null : Color(0xff222232),
              shape: BoxShape.circle,
            ),
            child: Image.asset('assets/${item.imagePath}', height: 36),
          ),
          SizedBox(height: 6),
          Text(item.name,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600))
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:untitled1/models/models.dart';

class SportItem extends StatelessWidget {
  final SportInfo item;
  final bool selected;
  final Function() onTap;

  const SportItem(
      {Key? key,
      required this.item,
      required this.selected,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: !selected ? () => onTap() : null,
          child: Container(
            height: 116,
            width: 108,
            alignment: Alignment.center,
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
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/${item.imagePath}', height: 36),
                SizedBox(height: 12),
                Text(item.name,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600))
              ],
            ),
          ),
        ),
      ],
    );
  }
}

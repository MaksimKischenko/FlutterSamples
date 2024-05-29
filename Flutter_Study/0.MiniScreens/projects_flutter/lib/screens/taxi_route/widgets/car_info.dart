import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:untitled1/models/models.dart';

class CarInfo extends StatelessWidget {
  final BookVartiant item;
  final bool selected;
  final Function(BookVartiant item) onTap;

  const CarInfo(
      {required this.item, required this.selected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(item),
      behavior: HitTestBehavior.translucent,
      child: Opacity(
        opacity: selected ? 1 : 0.4,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 3),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset('assets/icon/${item.iconName}.svg'),
              Text(item.name,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400)),
              RichText(
                  text: TextSpan(
                      style: TextStyle(
                        color: Color(0xff3E4958),
                        fontWeight: FontWeight.w800,
                      ),
                      children: [
                    WidgetSpan(
                        alignment: PlaceholderAlignment.top,
                        child: Text(
                          '\$',
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        )),
                    TextSpan(
                        text: '${item.cost.floor()}',
                        style: TextStyle(fontSize: 18)),
                    WidgetSpan(
                        alignment: PlaceholderAlignment.top,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 2),
                          child: Text(
                            '${((item.cost % 1).roundFixed() * 100).floor()}',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        )),
                  ])),
              SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                    color: Color.fromRGBO(232, 232, 232, 1),
                    borderRadius: BorderRadius.circular(100)),
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                child: Text('${item.arriveTime} min',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                      color: Colors.white,
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}

extension DoubleExtension on double {
  double roundFixed() {
    num mod = pow(10.0, 2);
    return ((this * mod).round().toDouble() / mod);
  }
}

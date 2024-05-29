import 'package:flutter/material.dart';
import 'package:untitled1/models/models.dart';

class PtsClubItem extends StatelessWidget {
  final List<String> result;
  PtsClubItem({
    Key? key,
    required this.result,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(8),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: _colorItem(place: int.tryParse(result[0])!),
            borderRadius: BorderRadius.circular(10)),
        child: SizedBox(
          height: 24,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: result.length,
            itemBuilder: (context, index) =>
                _alignment(index: index, text: result),
            separatorBuilder: (context, index) => SizedBox(width: 23),
          ),
        ));
  }

  Color _colorItem({required int place}) {
    if (place <= 3)
      return Color(0xff14274D);
    else if (place > 3 && place < 6)
      return Color(0xff441818);
    else
      return Color(0xff181829);
  }

  Widget _alignment({required int index, required List<String> text}) {
    if (index == 1) {
      return Container(
          alignment: Alignment.topLeft,
          width: 106,
          child: Text('${text[index]}',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w400)));
    } else
      return Text('${text[index]}',
          style: TextStyle(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400));
  }
}

import 'package:flutter/material.dart';

class Tippings extends StatelessWidget {
  final int? value;
  final Function(int? value) onTap;

  const Tippings({
    Key? key,
    required this.value,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      child: ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 4),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => GestureDetector(
              child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Container(
                      decoration: BoxDecoration(
                        color: index == value ? Colors.blue : Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.08),
                              offset: Offset(0, 8),
                              blurRadius: 14)
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 15),
                        child: Text('${index * 5}%',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: index == value
                                    ? Colors.white
                                    : Color(0xff3E4958),
                                fontSize: 20,
                                fontWeight: FontWeight.w700)),
                      ))),
              onTap: () => onTap(index == value ? null : index)),
          separatorBuilder: (context, _) => SizedBox(width: 10),
          itemCount: 6),
    );
  }
}

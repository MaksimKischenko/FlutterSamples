import 'package:flutter/material.dart';
import 'package:widgets_example/widgets/widgets.dart';




class Keyboard extends StatelessWidget {
  static const double columnPadding = 0;

  final Function(int value) onNumTap;
  final Function() onBackspaceTap;

  Keyboard({
    required this.onNumTap,
    required this.onBackspaceTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              KeyboardButton(onTap: () => onNumTap(1), child: Text('1')),
              KeyboardButton(onTap: () => onNumTap(2), child: Text('2')),
              KeyboardButton(onTap: () => onNumTap(3), child: Text('3')),
            ],
          ),
          SizedBox(height: columnPadding),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              KeyboardButton(onTap: () => onNumTap(4), child: Text('4')),
              KeyboardButton(onTap: () => onNumTap(5), child: Text('5')),
              KeyboardButton(onTap: () => onNumTap(6), child: Text('6')),
            ],
          ),
          SizedBox(height: columnPadding),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              KeyboardButton(onTap: () => onNumTap(7), child: Text('7')),
              KeyboardButton(onTap: () => onNumTap(8), child: Text('8')),
              KeyboardButton(onTap: () => onNumTap(9), child: Text('9')),
            ],
          ),
          SizedBox(height: columnPadding),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              KeyboardButton(onTap: () => onNumTap(0), child: Text('0')),
              KeyboardButton(
                  onTap: onBackspaceTap,
                  child: Icon(
                    Icons.backspace,
                    color: Colors.grey,
                    size: 28,
                  )),
            ],
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class MenuBottom extends StatelessWidget {
  final int selectedIndex;
  final Function(int selected) onTap;

  List<IconData> _items = [
    Icons.upload_file,
    Icons.folder_open,
    Icons.people,
    Icons.settings
  ];

  MenuBottom({required this.selectedIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 14, bottom: 30, right: 34, left: 34),
      child: SafeArea(
        child: Row(
          children: _items.map((e) => _item(icon: e)).toList(),
        ),
      ),
    );
  }

  Widget _item({required IconData icon}) {
    final index = _items.indexOf(icon);
    final selected = index == selectedIndex;
    return Expanded(
        child: IconButton(
            icon: Icon(icon,
                color: selected
                    ? Color(0xff47A7FF)
                    : Color(0xff39434C).withOpacity(0.40)),
            onPressed: selected ? null : () => onTap(index)));
  }
}

import 'package:flutter/material.dart';

class MenuBottom extends StatelessWidget {
  final int selectedIndex;
  final Function(int index) onTap;

  const MenuBottom({required this.selectedIndex, required this.onTap});

  static const Map<String, IconData> _items = {
    'Home': Icons.home,
    'Explore': Icons.explore,
    'Stat': Icons.poll,
    'Profile': Icons.person
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      color: Color(0xff222232),
      child: SafeArea(
        child: Row(
            children: _items
                .map((name, icon) =>
                    MapEntry(name, _item(name: name, icon: icon)))
                .values
                .toList()),
      ),
    );
  }

  Widget _item({required String name, required IconData icon}) {
    Widget body = Container();
    final index = _items.keys.toList().indexOf(name);
    final selected = index == selectedIndex;
    if (selected) {
      body = Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(name,
              style: TextStyle(
                  color: Color(0xff246BFD),
                  fontSize: 14,
                  fontWeight: FontWeight.w600)),
          SizedBox(height: 6),
          Container(
            width: 5,
            height: 5,
            decoration:
                BoxDecoration(color: Color(0xff246BFD), shape: BoxShape.circle),
          )
        ],
      );
    } else {
      body = IconButton(
          icon: Icon(icon, color: Colors.grey), onPressed: () => onTap(index));
    }
    return Expanded(child: body);
  }
}

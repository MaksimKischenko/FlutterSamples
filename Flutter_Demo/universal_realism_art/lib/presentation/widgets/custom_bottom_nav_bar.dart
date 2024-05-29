import 'package:universal_realism_art/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomBottomNavBar extends StatelessWidget {

  final Animation<Offset> position;
  final Function (int index) onItemTapped;
  final int currentIndex;

  const CustomBottomNavBar({
    Key? key,
    required this.position,
    required this.onItemTapped,
    required this.currentIndex
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Positioned(
    bottom: 30,
    left: 0,
    right: 0,
    child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SlideTransition(
        position: position,
        child: ClipRRect(
        borderRadius: BorderRadius.circular(12),              
        child: BottomNavigationBar(
          items: MenuTab.values.map((it) => BottomNavigationBarItem(          
            icon: SvgPicture.asset(
              it.location,
              width: 32,
              height: 32,
            ),  
            label: '',
            tooltip: MenuTabTooltip.menuTabKeys[it]
          )).toList(),
          currentIndex: currentIndex,
          onTap: onItemTapped,
        ),
        ),         
      ),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:untitled1/models/models.dart';

class LocationItem extends StatelessWidget {
  final Location item;
  final Function(Location item) onTap;

  const LocationItem({required this.item, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => onTap(item),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[300],
              ),
              child: Icon(
                Icons.location_on_rounded,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.address,
                  style: TextStyle(),
                ),
                Text(
                  item.city,
                  style: TextStyle(color: Colors.black.withOpacity(0.5)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

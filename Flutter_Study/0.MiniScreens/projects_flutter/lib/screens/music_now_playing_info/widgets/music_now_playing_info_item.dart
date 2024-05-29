import 'package:flutter/material.dart';
import 'package:untitled1/models/models.dart';

class MusicNowPlayingInfoItem extends StatelessWidget {
  final MusicNowPlaying item;
  final double opacity;

  const MusicNowPlayingInfoItem(
      {Key? key, required this.item, required this.opacity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(36),
          child: Opacity(
              opacity: opacity,
              child: Image.asset(item.picture, fit: BoxFit.cover, height: 230)),
        ),
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.favorite, color: Colors.red),
        ),
      ],
    );
  }
}

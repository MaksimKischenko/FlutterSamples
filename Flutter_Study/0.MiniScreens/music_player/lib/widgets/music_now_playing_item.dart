import 'package:flutter/material.dart';
import 'package:music_player/models/music_now_playing.dart';

class MusicNowPlayingItem extends StatelessWidget {
  final MusicNowPlaying item;
  final double opacity;

  const MusicNowPlayingItem(
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
            child: Image.asset(item.picture, fit: BoxFit.cover, height: 230)
          ),
        ),
        Container(
          width: 42,
          height: 42,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.favorite, color: Colors.red),
        ),
      ],
    );
  }
}

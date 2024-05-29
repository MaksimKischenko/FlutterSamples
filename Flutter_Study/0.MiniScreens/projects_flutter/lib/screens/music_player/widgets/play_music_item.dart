import 'dart:ui';

import 'package:flutter/material.dart';

class PlayMusicItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(26), topRight: Radius.circular(26)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 19.0, sigmaY: 19.0),
        child: Container(
          color: Color(0xffFFFFFF).withOpacity(0.4),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Image.asset('assets/Playing.png'),
              SizedBox(width: 14),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Amused City',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: Colors.black),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 2),
                    Text(
                      'Vanel Ghart',
                      style: TextStyle(
                          color: Color(0xff828282),
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ),
              SizedBox(width: 14),
              Icon(Icons.favorite,
                  size: 32, color: Color.fromRGBO(130, 130, 130, 0.55))
            ],
          ), //Color(0xffFFFFFF).withOpacity(0.76),
        ),
      ),
    );
  }
}

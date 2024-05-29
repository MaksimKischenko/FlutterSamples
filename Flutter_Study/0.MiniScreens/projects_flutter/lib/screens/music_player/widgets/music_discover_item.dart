import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:untitled1/models/models.dart';

class MusicDiscoverItem extends StatelessWidget {
  final MusicDiscover item;

  const MusicDiscoverItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(36),
        child: Stack(
          children: [
            ConstrainedBox(
              constraints: const BoxConstraints.expand(),
              child: Image.asset(
                'assets/Discover.png',
                fit: BoxFit.cover,
                //fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Color(0xffFFFFFF).withOpacity(0.2),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            item.song,
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Colors.white),
                            maxLines: 1,
                          ),
                          SizedBox(height: 6),
                          Text(
                            item.style,
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Color(0xffFFFFFF).withOpacity(0.62)),
                            maxLines: 1,
                          )
                        ],
                      ),

                      // child: Stack(
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

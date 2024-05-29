import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled1/models/models.dart';

import 'widgets/widgets.dart';

class MusicPlayerScreen extends StatelessWidget {
  final List<MusicOffer> offers = [
    MusicOffer(
        singer: 'Ayesha Ruhin',
        song: 'Some Feeling',
        color: Color(0xff9570FF).withOpacity(0.1),
        avatar: 'music_offer_avatar.png'),
    MusicOffer(
        singer: 'Jane Cooper',
        song: "I Didn't Know",
        color: Color(0xff6FCF97).withOpacity(0.1),
        avatar: 'music_offer_avatar.png'),
    MusicOffer(
        singer: 'Ayesha Ruhin',
        song: 'Some Feeling',
        color: Color(0xff9570FF).withOpacity(0.1),
        avatar: 'music_offer_avatar.png'),
  ];

  final List<MusicDiscover> discovers = [
    MusicDiscover(
        song: 'Out of My Mine', style: 'Dance', avatar: 'Discover.png'),
    MusicDiscover(song: 'Freak In Me', style: 'Dance', avatar: 'Discover.png'),
    MusicDiscover(
        song: 'Freak In Me', style: 'Electronic', avatar: 'Discover.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 26),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              color: Color(0xffC67D0F).withOpacity(0.19),
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset('assets/user.png'),
                          ),
                          SvgPicture.asset('assets/icon/look.svg', width: 48),
                        ],
                      ),
                    ),
                    SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: 20),
                        Expanded(
                          child: Text(
                            'Find the best \nmusic for you',
                            softWrap: true,
                            style: TextStyle(
                                color: Color(0xff333333),
                                fontSize: 28,
                                fontWeight: FontWeight.w800,
                                height: 1.1),
                          ),
                        ),
                        Image.asset('assets/Point_right.png')
                      ],
                    ),
                    SizedBox(height: 24),
                    SizedBox(
                      height: 70,
                      child: ListView.separated(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => MusicOfferItem(
                                item: offers[index],
                              ),
                          separatorBuilder: (context, _) => SizedBox(width: 24),
                          itemCount: offers.length),
                    ),
                    SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Discover',
                        softWrap: true,
                        style: TextStyle(
                            color: Color(0xff333333),
                            fontSize: 28,
                            fontWeight: FontWeight.w800,
                            height: 1.1),
                      ),
                    ),
                    SizedBox(height: 15),
                    SizedBox(
                      height: 150,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          itemBuilder: (context, index) => MusicDiscoverItem(
                                item: discovers[index],
                              ),
                          separatorBuilder: (context, _) => SizedBox(width: 14),
                          itemCount: discovers.length),
                    ),
                    SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'New Release',
                        softWrap: true,
                        style: TextStyle(
                            color: Color(0xff333333),
                            fontSize: 28,
                            fontWeight: FontWeight.w800,
                            height: 1.1),
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      height: 150,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          itemBuilder: (context, index) => MusicDiscoverItem(
                                item: discovers[index],
                              ),
                          separatorBuilder: (context, _) => SizedBox(width: 14),
                          itemCount: discovers.length),
                    ),
                    SizedBox(height: 120),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              child: Align(
                  alignment: Alignment.bottomCenter, child: PlayMusicItem())),
        ],
      ),
    );
  }
}

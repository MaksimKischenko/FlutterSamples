
import 'package:flutter/material.dart';
import 'models/music_now_playing.dart';
import 'widgets/music_now_playing_item.dart';


class MusicNowPlayingScreen extends StatefulWidget {
  @override
  _MusicNowPlayingScreenState createState() => _MusicNowPlayingScreenState();
}

class _MusicNowPlayingScreenState extends State<MusicNowPlayingScreen> {
  int value = 0;

  final List<MusicNowPlaying> tracks = [
    MusicNowPlaying(
        picture: 'assets/now_playing_center.png',
        song: 'Freak In Me1',
        singer: 'Mild Orange1'),
    MusicNowPlaying(
        picture: 'assets/now_playing_center.png',
        song: 'Freak In Me2',
        singer: 'Mild Orange2'),
    MusicNowPlaying(
        picture: 'assets/now_playing_center.png',
        song: 'Freak In Me3',
        singer: 'Mild Orange3'),
  ];

  final PageController controller = PageController(initialPage: 0, viewportFraction: 0.6);

  int pageIndex = 0;
  var currentPageValue = 0.0;
  double? height = 88.0;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        currentPageValue = controller.page ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Now playing',
          style: TextStyle(
            color: Color(0xff333333),
            fontSize: 26,
            fontWeight: FontWeight.w800,
            height: 1.1
          )
        ),
        centerTitle: true,
        leadingWidth: 48,
        leading: Container(
          margin: const EdgeInsets.only(left: 16),
          decoration: BoxDecoration(
            color: const Color(0xff9570FF).withOpacity(0.19),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.arrow_back),
        ),
      ),
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
                padding: const EdgeInsets.only(top: 26),
                child: Column(
                  children: [
                    const SizedBox(height: 40),
                    SizedBox( 
                      height: 295,
                      child: PageView.builder(
                        itemCount: tracks.length,
                        controller: controller,
                        onPageChanged: (value) {
                          setState(() {
                            pageIndex = value;
                          });
                        },
                        itemBuilder: (context, index) {
                          Widget body = Container();
                          if (index == currentPageValue.floor()) {
                            body = Padding(
                              padding: const EdgeInsets.only(left: 10, right: 10),
                              child: Transform.scale(
                                scale: 1.1,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10),
                                  child: MusicNowPlayingItem(
                                    item: tracks[index],
                                    opacity: 1.0,
                                  ),
                                ),
                              ),
                            );
                          } else {
                            body = Transform.scale(
                              scale: 0.9,
                              child: MusicNowPlayingItem(
                                item: tracks[index],
                                opacity: 0.5,
                              ),
                            );
                          }
                          return body;
                        },
                        scrollDirection: Axis.horizontal,
                      )
                    ),
                    const SizedBox(height: 24),
                    Text(
                      tracks[pageIndex].song,
                      softWrap: true,
                      maxLines: 1,
                      style: const TextStyle(
                        color: Color(0xff333333),
                        fontSize: 23,
                        fontWeight: FontWeight.w800,
                        height: 1.2
                      )
                    ),
                    const SizedBox(height: 8),
                    Text(
                      tracks[pageIndex].singer,
                      softWrap: true,
                      maxLines: 1,
                      style: const TextStyle(
                          color: Color(0xff828282),
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          height: 1.1
                      )
                    ),
                    const SizedBox(height: 40),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 34),
                      child: LinearProgressIndicator(
                        minHeight: 2,
                        value: 0.3,
                        // backgroundColor: Color(0xff9570FF),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text('0:36',
                          style: TextStyle(
                            color: Color(0xff9570FF),
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          )
                        ),
                        IconButton(
                          icon: const Icon(Icons.skip_previous, size: 25),
                          onPressed: () {},
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 4, vertical: 4),
                              decoration: BoxDecoration(
                                  color: const Color(0xff9570FF).withOpacity(0.1),
                                  shape: BoxShape.circle),
                              child: const Icon(Icons.play_arrow_rounded, size: 25)),
                        ),
                        IconButton(
                          icon: const Icon(Icons.skip_next, size: 25),
                          onPressed: () {},
                        ),
                        const Text('0:36',
                          style: TextStyle(
                            color: Color(0xffBDBDBD),
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          )
                        ),
                      ],
                    ),
                    // SizedBox(height: 20),
                  ],
                )),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    offset: const Offset(0, 8),
                    blurRadius: 14
                  )
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.music_note),
                  const SizedBox(width: 14),
                  const Expanded(
                    child: Text('Lyrics',
                      style: TextStyle(
                        color: Color(0xff333333),
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      )
                    ),
                  ),
                  const SizedBox(width: 14),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        //height = 488.0;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              offset: const Offset(0, 0),
                              blurRadius: 14
                            )
                          ]),
                      child: const Icon(Icons.arrow_drop_up),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

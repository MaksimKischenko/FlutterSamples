import 'package:flutter/material.dart';
import 'package:untitled1/models/models.dart';

import 'widgets/widgets.dart';

class SportLivescoreScreen extends StatefulWidget {
  @override
  _SportLivescoreScreenState createState() => _SportLivescoreScreenState();
}

class _SportLivescoreScreenState extends State<SportLivescoreScreen> {
  int _menuIndex = 0;

  int _selectedIndex = 0;

  final List<SportInfo> sports = [
    SportInfo(
      name: 'Soccer',
      imagePath: 'soccer.png',
    ),
    SportInfo(
      name: 'Basketball',
      imagePath: 'basketball.png',
    ),
    SportInfo(
      name: 'Football',
      imagePath: 'football.png',
    ),
    SportInfo(
      name: 'Baseball',
      imagePath: 'baseball.png',
    ),
    SportInfo(
      name: 'Tennis',
      imagePath: 'tennis.png',
    ),
    SportInfo(
      name: 'Volleyball',
      imagePath: 'volleyball.png',
    )
  ];

  final List<LeagueInfo> leagueInfo = [
    LeagueInfo(leagueName: 'La Liga', country: 'Spain', matches: [
      ClubInfoMatch(
          firstClubImagePath: 'barcelona.png',
          firstClubName: 'Barcelona',
          secondClubImagePath: 'realmadrid.png',
          secondClubName: 'Real Madrid',
          firstScoreNum: 2,
          secondScoreNum: 0),
    ]),
    LeagueInfo(leagueName: 'Premier League', country: 'England', matches: [
      ClubInfoMatch(
          firstClubImagePath: 'aston_vila.png',
          firstClubName: 'Aston Villa',
          secondClubImagePath: 'liverpool.png',
          secondClubName: 'Liverpool',
          firstScoreNum: 3,
          secondScoreNum: 2),
    ]),
    LeagueInfo(leagueName: 'La Liga', country: 'Spain', matches: [
      ClubInfoMatch(
          firstClubImagePath: 'realmadrid.png',
          firstClubName: 'Real Madrid',
          secondClubImagePath: 'realmadrid.png',
          secondClubName: 'Real Madrid',
          firstScoreNum: 2,
          secondScoreNum: 0),
      ClubInfoMatch(
          firstClubImagePath: 'realmadrid.png',
          firstClubName: 'Real Madrid',
          secondClubImagePath: 'realmadrid.png',
          secondClubName: 'Real Madrid',
          firstScoreNum: 2,
          secondScoreNum: 0),
    ]),
    LeagueInfo(leagueName: 'La Liga', country: 'Spain', matches: [
      ClubInfoMatch(
          firstClubImagePath: 'realmadrid.png',
          firstClubName: 'Real Madrid',
          secondClubImagePath: 'realmadrid.png',
          secondClubName: 'Real Madrid',
          firstScoreNum: 2,
          secondScoreNum: 0),
      ClubInfoMatch(
          firstClubImagePath: 'realmadrid.png',
          firstClubName: 'Real Madrid',
          secondClubImagePath: 'realmadrid.png',
          secondClubName: 'Real Madrid',
          firstScoreNum: 2,
          secondScoreNum: 0),
      ClubInfoMatch(
          firstClubImagePath: 'realmadrid.png',
          firstClubName: 'Real Madrid',
          secondClubImagePath: 'realmadrid.png',
          secondClubName: 'Real Madrid',
          firstScoreNum: 2,
          secondScoreNum: 0),
    ]),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff181829),
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: Colors.transparent,
        title: Text('LiveScore',
            style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w400)),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: Colors.white,
              size: 26,
            ),
          ),
          IconButton(
              onPressed: () {},
              icon: Stack(
                clipBehavior: Clip.none,
                children: [
                  Icon(Icons.notifications, color: Colors.white, size: 26),
                  Positioned(
                      top: -12,
                      right: -8,
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: Color(0xff181829), width: 2),
                            gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [
                                  Color(0xffF4A58A),
                                  Color(0xffED6B4E),
                                ]),
                            shape: BoxShape.circle),
                        child: Text(
                          '3',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ))
                ],
              ))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28),
                    child: PreviewBoxItem(
                      sportName: 'Football',
                      title: 'Liverpool UEFA\nChampion League\nCelebration',
                      time: 'Yesterday, 06.30 PM',
                    ),
                  ),
                  SizedBox(height: 32),
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 28),
                        itemCount: sports.length,
                        itemBuilder: (context, index) => SportItem(
                            onTap: () {
                              setState(() {     
                                _selectedIndex = index;                                                   
                              });
                            }, 
                            item: sports[index],
                            selected: _selectedIndex == index),
                        separatorBuilder: (context, _) => SizedBox(width: 14)),
                  ),
                  ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 28),
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: leagueInfo.length,
                      itemBuilder: (context, index) =>
                          LeagueItem(leagueInfo[index])),
                ],
              ),
            ),
          ),
          MenuBottom(
            selectedIndex: _menuIndex,
            onTap: (index) => setState(() => _menuIndex = index),
          )
        ],
      ),
    );
  }
}

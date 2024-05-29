import 'package:flutter/material.dart';
import 'package:untitled1/models/models.dart';
import 'package:untitled1/screens/sport_interest/widgets/widgets.dart';

class SportInterestScreen extends StatefulWidget {
  @override
  _SportInterestScreenState createState() => _SportInterestScreenState();
}

class _SportInterestScreenState extends State<SportInterestScreen> {
  SportInfo? selectedItem;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 90),
              Text('What sport do\nyou interest?',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.w600)),
              SizedBox(height: 14),
              Text("You can choose more than one!",
                  style: TextStyle(
                      color: Color(0xff65656B),
                      fontSize: 16,
                      fontWeight: FontWeight.w400)),
              SizedBox(height: 60),
              SizedBox(
                height: 240,
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 150,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 12),
                    itemCount: sports.length,
                    itemBuilder: (context, index) => SportItem(
                          onTap: (item) => setState(() => selectedItem = item),
                          item: sports[index],
                          selected: selectedItem == sports[index],
                        )),
              ),
              SizedBox(height: 90),
              MaterialButton(
                  minWidth: double.maxFinite,
                  onPressed: () {},
                  padding: EdgeInsets.symmetric(horizontal: 128, vertical: 20),
                  child: Text('Continue',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600)),
                  color: Color(0xff246BFD),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  )),
              SizedBox(height: 10),
              Center(
                child: TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(vertical: 18))),
                    child: Text('Skip',
                        style: TextStyle(
                            color: Color(0xffC4C4C4),
                            fontSize: 18,
                            fontWeight: FontWeight.w400))),
              )
            ],
          ),
        ),
      ),
    );
  }
}

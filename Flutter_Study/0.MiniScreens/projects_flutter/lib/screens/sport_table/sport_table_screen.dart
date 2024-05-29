import 'package:flutter/material.dart';
import 'package:untitled1/models/models.dart';

import 'package:untitled1/screens/sport_table/widgets/widget.dart';

class SportTableScreen extends StatefulWidget {
  @override
  _SportTableScreenState createState() => _SportTableScreenState();
}

class _SportTableScreenState extends State<SportTableScreen> {
  int? selectedItem;
  
  List<List<String>> resultLine = [
    List<String>.of(['1', 'Atletico Madrid', '2', '1', '6', '23', '38']),
    List<String>.of(['2', 'Real Madrid', '4', '3', '7', '15', '37']),
    List<String>.of(['3', 'Barcelona', '4', '4', '9', '20', '34']),
    List<String>.of(['4', 'Villareal', '8', '2', '10', '16', '32']),
    List<String>.of(['5', 'Real Sociedad', '6', '5', '13', '13', '32']),
    List<String>.of(['6', 'Sevilla', '3', '4', '15', '12', '30']),
    List<String>.of(['7', 'Granada', '3', '7', '20', '11', '24']),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Column(
              children: [
                SizedBox(height: 50),
                Image.asset('assets/Spain.png'),
                SizedBox(height: 24),
                Container(
                  padding: EdgeInsets.all(18),
                  decoration: BoxDecoration(
                      color: Color(0xff222232), shape: BoxShape.circle),
                  child: Image.asset('assets/LaLiga.png'),
                ),
                SizedBox(height: 18),
                Text('La Liga',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w600)),
                SizedBox(height: 30),
                LocationGame(
                    onTap: (value) {
                      setState(() {
                        selectedItem = value;
                      });
                    },
                    value: selectedItem),
                SizedBox(height: 24),
                TeamPoints(),
                SizedBox(height: 8),
                Divider(
                  color: Color(0xff2B2B3D),
                ),
                SizedBox(height: 14),
                SizedBox(
                  height: 300,
                  child: ListView.separated(
                    scrollDirection: Axis.vertical,
                    itemCount: resultLine.length,
                    itemBuilder: (context, index) =>
                        PtsClubItem(result: resultLine[index]),
                    separatorBuilder: (context, _) => SizedBox(height: 8),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

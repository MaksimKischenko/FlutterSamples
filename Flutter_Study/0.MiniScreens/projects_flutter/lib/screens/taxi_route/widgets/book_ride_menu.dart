import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:untitled1/models/models.dart';

import 'widgets.dart';

class BookRideMenu extends StatefulWidget {
  final int minutes;

  const BookRideMenu({required this.minutes});

  @override
  _BookRideMenuState createState() => _BookRideMenuState();
}

class _BookRideMenuState extends State<BookRideMenu> {
  final List<BookVartiant> variants = const [
    BookVartiant(
        id: 1,
        iconName: 'car_standart',
        name: 'Standart',
        cost: 5.63,
        arriveTime: 3),
    BookVartiant(
        id: 2, iconName: 'car_exec', name: 'Exec', cost: 8.92, arriveTime: 5),
    BookVartiant(
        id: 3, iconName: 'car_van', name: 'Van', cost: 9.46, arriveTime: 4),
    BookVartiant(
        id: 4,
        iconName: 'car_standart',
        name: 'Standart',
        cost: 5.63,
        arriveTime: 3),
    BookVartiant(
        id: 5, iconName: 'car_exec', name: 'Exec', cost: 8.92, arriveTime: 5),
    BookVartiant(
        id: 6, iconName: 'car_van', name: 'Van', cost: 9.46, arriveTime: 4),
  ];

  BookVartiant? _selectedVartiant;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(38),
              topRight: Radius.circular(38),
            )),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: double.maxFinite,
              height: 205,
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                scrollDirection: Axis.horizontal,
                itemCount: variants.length,
                itemBuilder: (context, index) => CarInfo(
                  item: variants[index],
                  selected: _selectedVartiant == variants[index],
                  onTap: (item) => setState(() => _selectedVartiant = item),
                ),
                separatorBuilder: (context, _) => SizedBox(width: 12),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Estimated trip time',
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 13,
                              fontWeight: FontWeight.w400)),
                      Text('${widget.minutes} min',
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 13,
                              fontWeight: FontWeight.w400))
                    ],
                  ),
                  Spacer(),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 3, vertical: 0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                              color: Colors.grey.withOpacity(0.3), width: 1)),
                      child: SvgPicture.asset(
                        'assets/mastercard.svg',
                        width: 24,
                      )),
                  SizedBox(width: 6),
                  Text(
                    '**** 8295',
                    style: TextStyle(color: Color(0xff3E4958)),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
              child: MaterialButton(
                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 18),
                  minWidth: double.infinity,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  onPressed: () {},
                  color: Colors.blue,
                  child: Text('Book ride',
                      style: TextStyle(color: Colors.white, fontSize: 18))),
            ),
            SizedBox(height: 24)
          ],
        ));
  }
}

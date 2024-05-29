// import 'package:flutter/material.dart';

// import 'package:test_app/screens/sport_livescore/widgets/widgets.dart';

// class ScoreBoxItem extends StatelessWidget {
//   final String type;
//   final List<ClubInfoMatch> scoreInfo;
//   const ScoreBoxItem({
//     Key? key,
//     required this.type,
//     required this.scoreInfo,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.start,
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Container(
//             height: 68,
//             width: 280,
//             padding: EdgeInsets.all(16),
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(16),
//                     bottomLeft: Radius.circular(16)),
//                 color: Color(0xff2B2B3D)),
//             child: ClubsInfoItem(
//               scoreInfo: scoreInfo,
//             )),
//         Expanded(
//           child: Container(
//               height: 68,
//               alignment: Alignment.center,
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.only(
//                       topRight: Radius.circular(16),
//                       bottomRight: Radius.circular(16)),
//                   color: Color(0xff222232)),
//               child: Text(type,
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 14,
//                       fontWeight: FontWeight.w600))),
//         )
//       ],
//     );
//   }
// }

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:test_layout/material_state_color.dart';

import 'test_listtile.dart';


import 'package:flutter/material.dart';



// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key? key, this.title}) : super(key: key);

//   final String? title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   Color? color;
//   List<int> selectedIndexes  = [];
//   int selectedIndex = -1;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title ?? ''),
//       ),
//       body: Center(
//         child: Column(
//           children: <Widget>[
//             DataTable2(
//               dataRowColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
//                 if (states.contains(MaterialState.selected)) {
//                   return Colors.red; 
//                 } 
//                 return Colors.white;  
//               }),
//               columns: const [
//                 DataColumn2(label: Text('Language')),
//                 DataColumn2(label: Text('Translation')),
//               ],
//               rows: List<DataRow>.generate(20, (index) => DataRow2(
//                 selected: index == selectedIndex,
//                 onSelectChanged: (val) {
//                   setState(() {
//                     selectedIndex = index;
//                   });
//                 },
//                 cells: [
//                     DataCell(Text('1')),
//                     DataCell(Text('2'))
//                 ])).toList())
//           ],
//         ),
//       ),
//     );
//   }
// }



// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       routes: {
//         '/material/': (context) => const MaterialStateColorExample(),
//         '/listtile/': (context) => const ListTileTester(),
//       },
//       initialRoute: '/material/',
//     );
//   }
// }


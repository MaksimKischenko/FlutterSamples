import 'package:custom_child_app/custom_multichild_layout.dart';
import 'package:custom_child_app/custom_single_child_layout.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

//SINGLE CHILD LAYOUT
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Center(
//           child: Container(
//             color: Colors.blue,
//             child: CustomSingleChildLayout(
//               child: Container(
//                 width: 100,
//                 height: 100,
//                 color: Colors.red,
//               ),
//               delegate: OwnSingleChildLayoutDelegate()
//             ),
//           ),
//         ),
//       ),
//     ); 
//   }
// }


//MULTI CHILD LAYOUT
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Center(
//           child: Container(
//             color: Colors.blue,
//             child: CustomMultiChildLayout(
//               children: [
//                 //специальные виджеты 
//                 LayoutId(
//                   id: 1, 
//                   child: Container(
//                     width: 100,
//                     height: 100,
//                     color: Colors.pink,
//                   )
//                 ),
//                 LayoutId(
//                   id: 2, 
//                   child: Container(
//                     color: Colors.orange,
//                   )
//                 ),
//                 LayoutId(
//                   id: 3, 
//                   child: const Text('data', textDirection: TextDirection.ltr)
//                 )
//               ],
//               delegate: OwnMultiChildLayoutDelegate(),
//             ),
//           ),
//         ),
//       ),
//     ); 
//   }
// }


//MULTI CHILD LAYOUT_2
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            color: Colors.blue,
            child: CustomMultiChildLayout(
              children: [
                //специальные виджеты 
                LayoutId(
                  id: 1, 
                  child: const Text('Left')
                ),
                LayoutId(
                  id: 2, 
                  child: const Text('Midle')
                ),
                LayoutId(
                  id: 3, 
                  child: const Text('Right')
                ),
              ],
              delegate: OwnMultiChildLayoutDelegate(),
            ),
          ),
        ),
      ),
    ); 
  }
}

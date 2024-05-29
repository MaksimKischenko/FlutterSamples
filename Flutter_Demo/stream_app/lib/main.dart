import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stream_app/view_models/user_view_model.dart';

import 'data/local_data/user_local_data.dart';
import 'data/repositories/user_repository.dart';
import 'views/user_view/user_view.dart';


import 'dart:async';

///
// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Lazy Stream Example',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   // Ленивый поток для генерации данных.
//   final StreamController<int> _dataStreamController = StreamController<int>();

//   // Индекс следующего элемента для генерации.
//   int _nextDataIndex = 0;

//   // Данные, которые будут появляться по мере генерации.
//   final List<int> _data = [];

//   @override
//   void initState() {
//     super.initState();

//     _generateData();
//   }

//   // Генерация данных и добавление их в ленивый поток.
//   Future<void> _generateData() async {
//     while (_nextDataIndex < 50) {
//       await Future.delayed(const Duration(milliseconds: 500));
//       _dataStreamController.sink.add(_nextDataIndex);
//       _data.add(_nextDataIndex);
//       _nextDataIndex++;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Lazy Stream Example'),
//       ),
//       body: StreamBuilder<int>(
//         stream: _dataStreamController.stream,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.active) {
//             return ListView.builder(
//               itemCount: snapshot.data,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text('Item ${_data[index]}'),
//                 );
//               },
//             );
//           } else {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//         },
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _dataStreamController.close();
//     super.dispose();
//   }
// }




void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User stream application',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ChangeNotifierProvider(
        create: (context) => UserViewModel(
          userRepository: UserRepository(
            users: UserLocalData.usersData
          )
        ),
        child: const UserView()
      ),
    );
  }
}


import 'dart:convert';
import 'dart:io';

import 'data/student_model.dart';

void main() {
  print('Запуск Main');
  // ServerSocket.bind('127.0.0.1', 8084).then((serverSocket) {
  //   serverSocket.listen((socket) {
  //     socket.cast<List<int>>().transform(utf8.decoder).listen((event) {
  //       print(event);
  //       var student = Student.fromJson(jsonDecode(event));
  //       print(student);
  //       socket.write('Hello Client');
  //       exit(0);
  //     });
  //   });
  // });
  startUDPServer();
  print('Завершение Main');
}

void startUDPServer() async {
  var rawDatagramSocket = await RawDatagramSocket.bind(InternetAddress.loopbackIPv4, 8083);

  await for (RawSocketEvent event in rawDatagramSocket) {
    if (event == RawSocketEvent.read) {
      var dataGram = rawDatagramSocket.receive();
      var json = utf8.decode(dataGram!.data);
      print(json);
      var student = Student.fromJson(jsonDecode(json));
      print(student);
      rawDatagramSocket.send(
          utf8.encode('Hello, Client'), InternetAddress.loopbackIPv4, 8084);
      rawDatagramSocket.close();
      exit(0);
    }
  }
}

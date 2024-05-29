import 'dart:async';

class Age {
  
  int _age = 0;
  
  final _stream = StreamController<int>();
  
  Stream get subscribe => _stream.stream.asBroadcastStream();
  
  void operator +(int delta) {
    _age += delta;
    _stream.add(_age);
  }
}
class Ticker {
  Stream<int> tick({int? ticks = 0}) {
    return Stream.periodic(Duration(seconds: 1), (x) => ticks! + x + 1);
  }
}

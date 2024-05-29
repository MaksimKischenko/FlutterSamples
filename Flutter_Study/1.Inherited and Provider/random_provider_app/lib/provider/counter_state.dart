import 'package:flutter/cupertino.dart';
import 'package:random_provider_app/services/counter_service.dart';


class CounterState with ChangeNotifier {
  int value = 0;

  Future<void> randomizeCounter() async {
    final counterService = CounterService.filled();
    final value = await counterService.getRandomInt();
    this.value = value;
    notifyListeners();
  }
}
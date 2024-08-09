import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mvvm_arch_app/api/flight_api.dart';

class DataProvider extends ChangeNotifier{
  final _flightApi = FlightApi();
  var _flights = '';

  String get flights => _flights;

  Future<void> fetchFlights() async{
    _flights = await _flightApi.fetchFlight();
    log('DataProvider: $_flights');
    notifyListeners();
  }
}
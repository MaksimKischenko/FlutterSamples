import 'dart:async';

import 'package:untitled1/models/models.dart';
import 'package:untitled1/services/services.dart';

class WeatherRepository {
  final WeatherService weatherApiClient;

  WeatherRepository({required this.weatherApiClient});

  Future<Weather> getWeather(String city) async {
    final int locationId = await weatherApiClient.getLocationId(city);
    return weatherApiClient.fetchWeather(locationId);
  }
}

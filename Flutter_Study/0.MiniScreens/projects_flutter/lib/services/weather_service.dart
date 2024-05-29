import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:untitled1/models/models.dart';

class WeatherService {
  static const baseUrl = 'https://www.metaweather.com';
  final http.Client httpClient;

  WeatherService({
    required this.httpClient,
  });

  Future<int> getLocationId(String city) async {
    final locationUrl = '$baseUrl/api/location/search/?query=$city';
    final locationResponse = await this.httpClient.get(Uri.parse(locationUrl));
    if (locationResponse.statusCode != 200) {
      throw Exception('error getting locationId for city');
    }

    final locationJson = jsonDecode(locationResponse.body) as List;
    return (locationJson.first)['woeid'];
  }

  Future<Weather> fetchWeather(int locationId) async {
    final weatherUrl = '$baseUrl/api/location/$locationId';
    final weatherResponse = await this.httpClient.get(Uri.parse(weatherUrl));

    if (weatherResponse.statusCode != 200) {
      throw Exception('error getting weather for location');
    }

    final weatherJson = jsonDecode(weatherResponse.body);
    return Weather.fromJson(weatherJson);
  }
}


import 'dart:developer';

import 'package:http/http.dart' as http;

class FlightApi {
      FlightApi({http.Client? httpClient})
        : _httpClient = httpClient ?? http.Client();
  //static const _loyalityEndpoint = '$_baseUrl/loyalty';
  final http.Client _httpClient;


  Future<String> fetchFlight() async{
    final flightUri = Uri.http('kotlin-book.bignerdranch.com', '/2e/flight');
    final flightResponse = await _httpClient.get(flightUri);

    if (flightResponse.statusCode == 404) {
      log('statusCode 400');
    }
    if (flightResponse.statusCode != 200) {
      log('ERROR');
    }
    return flightResponse.body;
  } 
}




import 'package:dio/dio.dart';

const String _baseUrl = 'https://random-data-api.com/api';

class CounterService {
  
  factory CounterService.filled() {
    final dio = Dio(BaseOptions(baseUrl: _baseUrl));
    return CounterService._internal(dio); 
  }

  factory CounterService.empty(Dio _dio) => CounterService._internal(_dio);

  CounterService._internal(this._dio);

  final Dio _dio;

  Future<int> getRandomInt() async {
    final response = await _dio.get('/number/random_number');
    return (response.data['decimal'] as double).toInt();
  }

}
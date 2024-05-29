
import 'dart:convert';

import 'package:custom_onliner_app/data/data.dart';
import 'package:http/http.dart' as http;

const String _baseUrl = 'https://www.onliner.by/sdapi/catalog.api/search/products';

class GoodsService {
 
  Future<List<GoodsInfo>> getGoodsInfo(String? productName) async {
    final url = Uri.parse('$_baseUrl?query=$productName');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      Map<String, dynamic> tabs = json.decode(response.body);
      return tabs.values.map((json) => GoodsInfo.fromJson(json)).toList();
    } else {
      throw Exception();
    }
  }
}
  

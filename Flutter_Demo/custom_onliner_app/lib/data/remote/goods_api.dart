

import 'package:custom_onliner_app/data/data.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part  'goods_api.g.dart';

@RestApi(baseUrl:'https://www.onliner.by/sdapi/catalog.api/search/products')
abstract class GoodsApi {
factory GoodsApi (Dio dio, {String baseUrl}) = _GoodsApi;


@GET('/')
 Future<GoodsInfo> getGoodsRequest({
    @Query('query') String? productName,
 });
}



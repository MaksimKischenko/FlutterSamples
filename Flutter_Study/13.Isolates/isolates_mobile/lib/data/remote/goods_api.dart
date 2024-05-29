import 'package:isolates_mobile/data/remote_models/get_goods_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart' hide Headers;


part 'goods_api.g.dart';

@RestApi(baseUrl:'https://cre-api-v2.kufar.by/items-search/v1/engine/v1/search/rendered-paginated')
abstract class GoodsApi {
factory GoodsApi (Dio dio, {String baseUrl}) = _GoodsApi;


 @GET('')
 Future<GoodsInfo> getGoodsRequest({
    @Query('query') String? productName,
    @Query('size') int? listSize,
 });
}



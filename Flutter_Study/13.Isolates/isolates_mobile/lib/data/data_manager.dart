import 'package:dio/dio.dart';


import 'remote/goods_api.dart';
import 'remote_models/get_goods_response.dart';



class DataManager {
  final GoodsApi _postApi;

  final Dio dio;

  DataManager(this.dio) :
  _postApi = GoodsApi(dio);

  Future<GoodsInfo> getGoodsRequest({
    String? productName,
    int? listSize
  }) => _postApi.getGoodsRequest(
    productName: productName,
    listSize: listSize
  );

}

import 'package:custom_kufar_app/data/data.dart';
import 'package:dio/dio.dart';

import 'remote/goods_api.dart';

class DataManager {
  final GoodsApi _postApi;

  final Dio dio;

  DataManager(this.dio) : _postApi = GoodsApi(dio);

  Future<GoodsInfo> getGoodsRequest({
    String? productName,
    int? listSize
  }) => _postApi.getGoodsRequest(
    productName: productName,
    listSize: listSize
  );
}
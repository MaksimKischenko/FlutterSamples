// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goods_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _GoodsApi implements GoodsApi {
  _GoodsApi(this._dio, {this.baseUrl}) {
    baseUrl ??=
        'https://cre-api-v2.kufar.by/items-search/v1/engine/v1/search/rendered-paginated';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<GoodsInfo> getGoodsRequest({productName, listSize}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'query': productName,
      r'size': listSize
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GoodsInfo>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GoodsInfo.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'erip_postgres_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _EripPostgresApi implements EripPostgresApi {
  _EripPostgresApi(this._dio, {this.baseUrl}) {
    baseUrl ??= 'http://192.168.253.178:3000/ui';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<List<Supplier>> getSuppliersRequest({required count, lastId}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'limit': count,
      r'supplier_id': lastId
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<Supplier>>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/supplier?order=supplier_id',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => Supplier.fromJson(i as Map<String, dynamic>))
        .toList();
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

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:untitled1/screens/supliers/data/remote_models/get_suppliers_response.dart';


part 'erip_postgres_api.g.dart';

@RestApi(baseUrl: 'http://192.168.253.178:3000/ui')
abstract class EripPostgresApi {
  factory EripPostgresApi(Dio dio, {String baseUrl}) = _EripPostgresApi;

  @GET('/supplier?order=supplier_id')
  Future<List<Supplier>> getSuppliersRequest({
    @Query('limit') required int count,
    @Query('supplier_id') String? lastId,
  });

}
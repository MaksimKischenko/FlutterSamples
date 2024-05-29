import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:untitled1/screens_proj_test/postman/data/data.dart';

part  'post_api.g.dart';

@RestApi(baseUrl: 'https://jsonplaceholder.typicode.com')
abstract class PostApi{
factory PostApi(Dio dio, {String baseUrl}) = _PostApi;


 @GET('/posts')
  Future<List<PostModel>> getPostsRequest({
    @Query('limit') int? limit,
    @Query('start') int? start,
  });

}
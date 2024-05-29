import 'package:dio/dio.dart';
import 'package:untitled1/screens_proj_test/postman/data/remote/post_api.dart';


import 'data.dart';

class DataManager {
  final PostApi _postApi;

  final Dio dio;

  DataManager(this.dio) : _postApi = PostApi(dio);

  Future<List<PostModel>> getPostsRequest({
    int? limit,
    int? start

  }) => _postApi.getPostsRequest(
    limit: limit,
    start: start,
  );

}
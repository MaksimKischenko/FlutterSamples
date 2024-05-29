import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:untitled1/models/post.dart';

class PostService {
  static final String url = "https://jsonplaceholder.typicode.com/posts";

  static Future<List<Post>> fetchPosts(http.Client client) async {
    final response = await client.get(Uri.parse(url));
    return parsePostData(response.body);
  }

  static List<Post> parsePostData(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Post>((json) => Post.fromJson(json)).toList();
  }
}

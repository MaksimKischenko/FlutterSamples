import 'package:http/http.dart' as http;
import 'package:untitled1/models/comment.dart';
import 'dart:convert';

class CommentService {
  static final String url = "https://jsonplaceholder.typicode.com/comments";

  static Future<List<Comment>> fetchComments(http.Client client) async {
    final response = await client.get(Uri.parse(url));
    return parseCommentData(response.body);
  }

  static List<Comment> parseCommentData(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Comment>((json) => Comment.fromJson(json)).toList();
  }
}

import 'package:flutter/material.dart';

import 'package:untitled1/models/models.dart';

class PostItemList extends StatelessWidget {
  final Post post;
  final User? user;
  final Function(Post post) onCommentsTap;

  PostItemList({
    Key? key,
    required this.post,
    required this.user,
    required this.onCommentsTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(user?.email ?? 'unknown'),
        SizedBox(height: 8),
        Text(
          post.title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Text(
          post.body,
          style: TextStyle(color: Colors.blue),
        ),
        IconButton(
            icon: Icon(Icons.comment), onPressed: () => onCommentsTap(post))
      ]),
    );
  }
}

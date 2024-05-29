import 'package:flutter/material.dart';

import 'package:untitled1/models/comment.dart';

class CommentItem extends StatelessWidget {
  final Comment comment;

  CommentItem({
    Key? key,
    required this.comment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(comment.name),
        SizedBox(height: 8),
        Text(
          comment.body,
          style: TextStyle(color: Colors.blue),
        ),
      ]),
    );
  }
}

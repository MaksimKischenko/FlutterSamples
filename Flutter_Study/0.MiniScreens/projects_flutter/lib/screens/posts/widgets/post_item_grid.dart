import 'package:flutter/material.dart';

import 'package:untitled1/models/models.dart';

class PostItemGrid extends StatelessWidget {
  final Post post;
  final User? user;
  final Function(Post post) onCommentsTap;

  PostItemGrid({
    Key? key,
    required this.post,
    required this.user,
    required this.onCommentsTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          post.title,
          maxLines: 1,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Text(
          post.body,
          style: TextStyle(color: Colors.blue),
          maxLines: 4,
        ),
        Row(
          children: [
            Expanded(
                child: Text(
              user?.email ?? 'unknown',
              maxLines: 1,
              // overflow: TextOverflow.fade,
            )),
            SizedBox(width: 8),
            IconButton(
                icon: Icon(Icons.comment),
                onPressed: () => onCommentsTap(post)),
          ],
        )
      ]),
    );
  }
}

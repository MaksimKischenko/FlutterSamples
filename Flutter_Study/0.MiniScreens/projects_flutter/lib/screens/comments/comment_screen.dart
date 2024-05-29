import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/blocs/blocs.dart';

import 'widgets/widgets.dart';

class CommentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Comments'),
        ),
        body:
            BlocBuilder<CommentsBloc, CommentsState>(builder: (context, state) {
          Widget body = Container();
          if (state is CommentsLoading) {
            body = Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: double.maxFinite),
                CircularProgressIndicator()
              ],
            );
          } else if (state is CommentList) {
            body = ListView.separated(
                itemCount: state.comments.length,
                separatorBuilder: (context, index) => Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Divider(),
                    ),
                itemBuilder: (context, index) {
                  final comment = state.comments[index];
                  return CommentItem(
                    comment: comment,
                  );
                });
          }
          return body;
        }),
      ),
    );
  }
}

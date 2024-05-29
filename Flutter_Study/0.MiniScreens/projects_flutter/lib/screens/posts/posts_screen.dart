import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/blocs/blocs.dart';
import 'package:untitled1/models/models.dart';
import 'package:untitled1/screens/screens.dart';

import 'widgets/widgets.dart';

class PostsScreen extends StatefulWidget {
  @override
  _PostsScreenState createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  bool _isGrid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts"),
        actions: [
          IconButton(
              icon: Icon(_isGrid ? Icons.list : Icons.grid_view),
              onPressed: () => setState(() => _isGrid = !_isGrid)),
        ],
      ),
      body: BlocBuilder<PostsBloc, PostsState>(
        builder: (context, state) {
          Widget body = Container();
          if (state is PostsLoading) {
            body = Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: double.maxFinite),
                CircularProgressIndicator()
              ],
            );
          } else if (state is PostsList) {
            if (_isGrid) {
              body = GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: state.posts.length,
                  itemBuilder: (context, index) {
                    final post = state.posts[index];
                    final userIndex =
                        state.users.indexWhere((user) => user.id == post.id);
                    return PostItemGrid(
                      post: post,
                      user: userIndex > -1 ? state.users[userIndex] : null,
                      onCommentsTap: _onCommentsTap,
                    );
                  });
            } else {
              body = ListView.separated(
                  itemCount: state.posts.length,
                  separatorBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Divider(
                          color: Colors.blue,
                        ),
                      ),
                  itemBuilder: (context, index) {
                    final post = state.posts[index];
                    final userIndex =
                        state.users.indexWhere((user) => user.id == post.id);
                    return PostItemList(
                      post: post,
                      user: userIndex > -1 ? state.users[userIndex] : null,
                      onCommentsTap: _onCommentsTap,
                    );
                  });
            }
          } else if (state is PostsError) {
            body = Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(state.error, textAlign: TextAlign.center),
                SizedBox(height: 8),
                TextButton(
                    onPressed: () =>
                        context.read<PostsBloc>().add(PostsRefresh()),
                    child: Text('Retry'))
              ],
            );
          }
          return body;
        },
      ),
    );
  }

  void _onCommentsTap(Post post) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => BlocProvider<CommentsBloc>(
            create: (context) =>
                CommentsBloc(post: post)..add(CommentsRefresh()),
            child: CommentScreen())));
  }
}

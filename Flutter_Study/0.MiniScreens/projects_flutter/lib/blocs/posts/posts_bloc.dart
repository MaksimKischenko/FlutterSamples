import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:untitled1/models/post.dart';
import 'package:untitled1/models/user.dart';
import 'package:untitled1/services/services.dart';
import 'package:http/http.dart' as http;
import 'package:untitled1/services/user_service.dart';
part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc() : super(PostsLoading());

  @override
  Stream<PostsState> mapEventToState(
    PostsEvent event,
  ) async* {
    if (event is PostsRefresh) {
      yield* _mapPostsRefreshToState(event);
    }
  }

  Stream<PostsState> _mapPostsRefreshToState(PostsRefresh event) async* {
    yield PostsLoading();

    try {
      await Future.delayed(Duration(milliseconds: 500));
      final posts = await PostService.fetchPosts(http.Client());
      List<User> users = [];
      for (var post in posts) {
        final index = users.indexWhere((user) => user.id == post.userId);
        if (index == -1) {
          final response =
              await UserService.fetchUsers(http.Client(), post.userId);
          users.add(response.first);
        }
      }
      yield PostsList(posts: posts, users: users);
    } catch (error, stackTrace) {
      yield PostsError(error: error.toString());
    }
  }
}

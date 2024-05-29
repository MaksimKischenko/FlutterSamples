part of 'posts_bloc.dart';

abstract class PostsState extends Equatable {
  const PostsState();

  @override
  List<Object?> get props => [];
}

class PostsLoading extends PostsState {}

class PostsError extends PostsState {
  final String error;

  PostsError({required this.error});

  @override
  List<Object?> get props => [error];
}

class PostsList extends PostsState {
  final List<Post> posts;
  final List<User> users;

  PostsList({
    required this.posts,
    required this.users,
  });

  @override
  List<Object?> get props => [posts, users];
}

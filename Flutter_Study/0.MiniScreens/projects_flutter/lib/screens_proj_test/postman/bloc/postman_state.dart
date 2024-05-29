part of 'postman_bloc.dart';

abstract class PostmanState extends Equatable {
  const PostmanState();
  
  @override
  List<Object?> get props => [];
}

class PostmanLoading extends PostmanState {}

class PostmanLoaded extends PostmanState {

final List<PostModel> posts;
  PostmanLoaded({
    required this.posts,
  });

  @override
  List<Object?> get props => [posts];
}

class PostsInitError extends PostmanState {
  final Object? error;

  const PostsInitError({
    required this.error
  });

  @override
  List<Object?> get props => [error];
}

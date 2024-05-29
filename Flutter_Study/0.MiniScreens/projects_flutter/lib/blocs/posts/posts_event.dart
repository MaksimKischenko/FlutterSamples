part of 'posts_bloc.dart';

abstract class PostsEvent extends Equatable {
  const PostsEvent();

  @override
  List<Object> get props => [];
}

class PostsRefresh extends PostsEvent {}

class PostsLoadMore extends PostsEvent {}

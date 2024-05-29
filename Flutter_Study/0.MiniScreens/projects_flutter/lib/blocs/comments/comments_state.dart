part of 'comments_bloc.dart';

abstract class CommentsState extends Equatable {
  const CommentsState();

  @override
  List<Object?> get props => [];
}

class CommentsLoading extends CommentsState {}

class CommentList extends CommentsState {
  final List<Comment> comments;

  CommentList({
    required this.comments,
  });

  @override
  List<Object?> get props => [comments];
}

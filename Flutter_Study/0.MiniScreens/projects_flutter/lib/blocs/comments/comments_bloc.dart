import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:untitled1/models/comment.dart';
import 'package:untitled1/models/models.dart';
import 'package:untitled1/services/services.dart';
import 'package:http/http.dart' as http;

part 'comments_event.dart';
part 'comments_state.dart';

class CommentsBloc extends Bloc<CommentsEvent, CommentsState> {
  final Post post;

  CommentsBloc({required this.post}) : super(CommentsLoading());

  @override
  Stream<CommentsState> mapEventToState(
    CommentsEvent event,
  ) async* {
    if (event is CommentsRefresh) {
      yield* _mapCommentsOpenViewToState(event);
    }
  }

  Stream<CommentsState> _mapCommentsOpenViewToState(
      CommentsRefresh event) async* {
    final comments = await CommentService.fetchComments(http.Client());
    yield CommentList(comments: comments);
  }
}

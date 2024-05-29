import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:untitled1/injection_component.dart';
import 'package:untitled1/screens_proj_test/postman/data/data.dart';
import 'package:untitled1/screens_proj_test/postman/data/data_manager.dart';

part 'postman_event.dart';
part 'postman_state.dart';

class PostmanBloc extends Bloc<PostmanEvent, PostmanState> {
  DataManager dataManager;
  PostmanBloc() :  dataManager = InjectionComponent.getDependency<DataManager>(), 
  super(PostmanLoading());

  List<PostModel> _posts = [];
  @override
  Stream<PostmanState> mapEventToState(
    PostmanEvent event,
  ) async* {
    if(event is PostManInit){
      yield* _mapPostsToState(event);
    }
  }

    Stream<PostmanState> _mapPostsToState(
    PostmanEvent event
  ) async* {
    yield PostmanLoading();

    try {
      final postResponse = await dataManager.getPostsRequest(
        limit: 10,
        start: 0
      );
       
      _posts = postResponse;
    // ignore: avoid_catches_without_on_clauses
    } catch (error, _) {
      yield PostsInitError(
        error: error
      );
    }
  }


}

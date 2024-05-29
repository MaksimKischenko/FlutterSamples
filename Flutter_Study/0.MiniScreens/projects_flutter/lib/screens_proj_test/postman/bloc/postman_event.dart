part of 'postman_bloc.dart';

abstract class PostmanEvent extends Equatable {
  const PostmanEvent();

  @override
  List<Object?> get props => [];
}


class PostManInit extends PostmanEvent {}

// class PostManLoad extends PostmanEvent {
//   final int userID;
//   final int? id;
//   final String? title;
//   final String? body;

//  const PostManLoad({
//     required this.userID,
//     this.id,
//     this.title,
//     this.body
//   });
  
// }



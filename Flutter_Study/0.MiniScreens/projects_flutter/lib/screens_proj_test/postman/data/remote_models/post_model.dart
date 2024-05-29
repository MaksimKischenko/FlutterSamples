import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post_model.g.dart';

@JsonSerializable()
class PostModel extends Equatable {

 @JsonKey(name: 'userId')
 final int userID;

  @JsonKey(name: 'Id')
  final int? id;

  @JsonKey(name: 'title')
  final String? title;

  @JsonKey(name: 'body')
  final String? body;
  PostModel({
    required this.userID,
    this.id,
    this.title,
    this.body,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) => _$PostModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostModelToJson(this);

   
  @override
  List<Object?> get props => [userID, id, title, body];


}

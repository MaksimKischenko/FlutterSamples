// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostModel _$PostModelFromJson(Map<String, dynamic> json) {
  return PostModel(
    userID: json['userId'] as int,
    id: json['Id'] as int?,
    title: json['title'] as String?,
    body: json['body'] as String?,
  );
}

Map<String, dynamic> _$PostModelToJson(PostModel instance) => <String, dynamic>{
      'userId': instance.userID,
      'Id': instance.id,
      'title': instance.title,
      'body': instance.body,
    };

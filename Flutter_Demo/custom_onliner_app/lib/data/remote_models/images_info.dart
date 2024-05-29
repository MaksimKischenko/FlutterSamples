import 'package:json_annotation/json_annotation.dart';

part 'images_info.g.dart';

@JsonSerializable()
class ImagesInfo {

  @JsonKey(name: 'header')
  final String? headerUrl;
  
  ImagesInfo({
    this.headerUrl,
  });

 
  factory ImagesInfo.fromJson(Map<String, dynamic> json) => _$ImagesInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ImagesInfoToJson(this);
}

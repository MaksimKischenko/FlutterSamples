// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductInfo _$ProductInfoFromJson(Map<String, dynamic> json) => ProductInfo(
      id: json['id'] as int,
      name: json['name'] as String?,
      fullName: json['full_name'] as String?,
      extendedName: json['extended_name'] as String?,
      status: json['status'] as String?,
      imagesInfo: json['images'] == null
          ? null
          : ImagesInfo.fromJson(json['images'] as Map<String, dynamic>),
      description: json['description'] as String?,
      priceInfo: json['prices'] == null
          ? null
          : PriceInfo.fromJson(json['prices'] as Map<String, dynamic>),
      secondPriceInfo: json['second'] == null
          ? null
          : SecondPriceInfo.fromJson(json['second'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductInfoToJson(ProductInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'full_name': instance.fullName,
      'extended_name': instance.extendedName,
      'status': instance.status,
      'images': instance.imagesInfo,
      'description': instance.description,
      'prices': instance.priceInfo,
      'second': instance.secondPriceInfo,
    };

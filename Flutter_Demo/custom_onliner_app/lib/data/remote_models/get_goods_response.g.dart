// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_goods_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GoodsInfo _$GoodsInfoFromJson(Map<String, dynamic> json) => GoodsInfo(
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => ProductInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GoodsInfoToJson(GoodsInfo instance) => <String, dynamic>{
      'products': instance.products,
    };

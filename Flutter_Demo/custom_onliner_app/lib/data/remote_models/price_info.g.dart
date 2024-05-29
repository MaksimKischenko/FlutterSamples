// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PriceInfo _$PriceInfoFromJson(Map<String, dynamic> json) => PriceInfo(
      priceMin: json['price_min'] == null
          ? null
          : PriceMinInfo.fromJson(json['price_min'] as Map<String, dynamic>),
      priceMax: json['price_max'] == null
          ? null
          : PriceMinInfo.fromJson(json['price_max'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PriceInfoToJson(PriceInfo instance) => <String, dynamic>{
      'price_min': instance.priceMin,
      'price_max': instance.priceMax,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'second_price_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SecondPriceInfo _$SecondPriceInfoFromJson(Map<String, dynamic> json) =>
    SecondPriceInfo(
      offersCount: json['offers_count'] as int,
      minPrice: json['min_price'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$SecondPriceInfoToJson(SecondPriceInfo instance) =>
    <String, dynamic>{
      'offers_count': instance.offersCount,
      'min_price': instance.minPrice,
    };

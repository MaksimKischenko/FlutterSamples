// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ads_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdsItem _$AdsItemFromJson(Map<String, dynamic> json) => AdsItem(
      accountId: json['account_id'] as int,
      accountParams: (json['account_parameters'] as List<dynamic>)
          .map((e) => AccountParam.fromJson(e as Map<String, dynamic>))
          .toList(),
      adId: json['ad_id'] as int,
      adLink: json['ad_link'] as String,
      adParams: (json['ad_parameters'] as List<dynamic>)
          .map((e) => AdParam.fromJson(e as Map<String, dynamic>))
          .toList(),
      listId: json['list_id'] as int,
      listTime: DateTime.parse(json['list_time'] as String),
      subject: json['subject'] as String,
    );

Map<String, dynamic> _$AdsItemToJson(AdsItem instance) => <String, dynamic>{
      'account_id': instance.accountId,
      'account_parameters': instance.accountParams,
      'ad_id': instance.adId,
      'ad_link': instance.adLink,
      'ad_parameters': instance.adParams,
      'list_id': instance.listId,
      'list_time': instance.listTime.toIso8601String(),
      'subject': instance.subject,
    };

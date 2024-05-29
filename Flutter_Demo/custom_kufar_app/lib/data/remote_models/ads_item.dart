import 'package:json_annotation/json_annotation.dart';

import 'package:custom_kufar_app/data/remote_models/ad_params.dart';

import 'account_param.dart';

part 'ads_item.g.dart';

@JsonSerializable()
class AdsItem {

  @JsonKey(name: 'account_id')
  final int accountId;

  @JsonKey(name: 'account_parameters')
  final List<AccountParam> accountParams;

  @JsonKey(name: 'ad_id')
  final int adId;

  @JsonKey(name: 'ad_link')
  final String adLink;

  @JsonKey(name: 'ad_parameters')
  final List<AdParam> adParams;

  @JsonKey(name: 'list_id')
  final int listId;

  @JsonKey(name: 'list_time')
  final DateTime listTime;

  @JsonKey(name: 'subject')
  final String subject;
  
  AdsItem({
    required this.accountId,
    required this.accountParams,
    required this.adId,
    required this.adLink,
    required this.adParams,
    required this.listId,
    required this.listTime,
    required this.subject,
  });


  factory AdsItem.fromJson(Map<String, dynamic> json) => _$AdsItemFromJson(json);
  Map<String, dynamic> toJson() => _$AdsItemToJson(this);
}

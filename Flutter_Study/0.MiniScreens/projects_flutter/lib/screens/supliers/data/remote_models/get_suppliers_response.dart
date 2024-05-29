import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_suppliers_response.g.dart';

// @JsonSerializable()
// class GetSuppliersResponse {

//   @JsonKey(name: 'suppliers')
//   final List<Supplier> suppliers;

//   GetSuppliersResponse(this.request);

//   factory GetSuppliersResponse.fromJson(Map<String, dynamic> json) => _$GetSuppliersResponseFromJson(json);

//   Map<String, dynamic> toJson() => _$GetSuppliersResponseToJson(this);
  
// }

@JsonSerializable()
class Supplier {

  @JsonKey(name: 'supplier_id')
  final int id;

  @JsonKey(name: 'supplier_name')
  final String? name;

  @JsonKey(name: 'enabled')
  final bool enabled;

  @JsonKey(name: 'supplier_domicile')
  final String? address;

  @JsonKey(name: 'supplier_unp')
  final String? unp;

  @JsonKey(name: 'manager_post')
  final String? managerPost;

  @JsonKey(name: 'manager_name')
  final String? managerName;

  @JsonKey(name: 'bookkeeper_name')
  final String? bookkeeperName;

  @JsonKey(name: 'supplier_shortname')
  final String? shortName;

  @JsonKey(name: 'out_supplier_code')
  final String? outSupplierCode;

  @JsonKey(name: 'email')
  final String? email;

  @JsonKey(name: 'abonent')
  final String? abonent;

  @JsonKey(name: 'bank_id')
  final int? bankId;

  @JsonKey(name: 'bank_bic')
  final String? bankBic;

  @JsonKey(name: 'account')
  final String? account;

  @JsonKey(name: 'contract')
  final String? contract;

  Supplier({
    required this.id,
    this.name,
    this.enabled = false,
    this.address,
    this.unp,
    this.managerPost,
    this.managerName,
    this.bookkeeperName,
    this.shortName,
    this.outSupplierCode,
    this.email,
    this.abonent,
    this.bankId,
    this.bankBic,
    this.account,
    this.contract,
  });

  factory Supplier.fromJson(Map<String, dynamic> json) => _$SupplierFromJson(json);

  Map<String, dynamic> toJson() => _$SupplierToJson(this);

  Color get statusColor => enabled ? CupertinoColors.systemRed : CupertinoColors.systemGreen;

  String get statusText => enabled ? 'Подключен' : 'Отключен';
  
}

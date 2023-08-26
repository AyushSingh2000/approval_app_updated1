// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_supplier_blank_modal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetSupplierBlankModal _$GetSupplierBlankModalFromJson(
        Map<String, dynamic> json) =>
    GetSupplierBlankModal(
      bpmasterDetails: (json['bpmasterDetails'] as List<dynamic>)
          .map((e) => SupplierDetail_Blank.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetSupplierBlankModalToJson(
        GetSupplierBlankModal instance) =>
    <String, dynamic>{
      'bpmasterDetails': instance.bpmasterDetails,
    };

SupplierDetail_Blank _$SupplierDetail_BlankFromJson(
        Map<String, dynamic> json) =>
    SupplierDetail_Blank(
      CardCode: json['CardCode'] as String?,
      CardName: json['CardName'] as String?,
      GroupName: json['GroupName'] as String?,
      LicTradNum: json['LicTradNum'] as String?,
      RequestedBy: json['RequestedBy'],
      ApprovalStatus: json['ApprovalStatus'] as String?,
    );

Map<String, dynamic> _$SupplierDetail_BlankToJson(
        SupplierDetail_Blank instance) =>
    <String, dynamic>{
      'CardCode': instance.CardCode,
      'CardName': instance.CardName,
      'GroupName': instance.GroupName,
      'LicTradNum': instance.LicTradNum,
      'RequestedBy': instance.RequestedBy,
      'ApprovalStatus': instance.ApprovalStatus,
    };

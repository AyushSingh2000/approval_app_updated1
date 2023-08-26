// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_supplier_rejected_modal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetSupplierRejectedModal _$GetSupplierRejectedModalFromJson(
        Map<String, dynamic> json) =>
    GetSupplierRejectedModal(
      bpmasterDetails: (json['bpmasterDetails'] as List<dynamic>)
          .map((e) =>
              SupplierDetail_Rejected.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetSupplierRejectedModalToJson(
        GetSupplierRejectedModal instance) =>
    <String, dynamic>{
      'bpmasterDetails': instance.bpmasterDetails,
    };

SupplierDetail_Rejected _$SupplierDetail_RejectedFromJson(
        Map<String, dynamic> json) =>
    SupplierDetail_Rejected(
      CardCode: json['CardCode'] as String?,
      CardName: json['CardName'] as String?,
      GroupName: json['GroupName'] as String?,
      LicTradNum: json['LicTradNum'] as String?,
      RequestedBy: json['RequestedBy'],
      ApprovalStatus: json['ApprovalStatus'] as String?,
    );

Map<String, dynamic> _$SupplierDetail_RejectedToJson(
        SupplierDetail_Rejected instance) =>
    <String, dynamic>{
      'CardCode': instance.CardCode,
      'CardName': instance.CardName,
      'GroupName': instance.GroupName,
      'LicTradNum': instance.LicTradNum,
      'RequestedBy': instance.RequestedBy,
      'ApprovalStatus': instance.ApprovalStatus,
    };

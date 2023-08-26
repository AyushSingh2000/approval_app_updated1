// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_supplier_unApproved_modal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetSupplierUnApprovedModal _$GetSupplierUnApprovedModalFromJson(
        Map<String, dynamic> json) =>
    GetSupplierUnApprovedModal(
      bpmasterDetails: (json['bpmasterDetails'] as List<dynamic>)
          .map((e) =>
              SupplierDetail_UnApproved.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetSupplierUnApprovedModalToJson(
        GetSupplierUnApprovedModal instance) =>
    <String, dynamic>{
      'bpmasterDetails': instance.bpmasterDetails,
    };

SupplierDetail_UnApproved _$SupplierDetail_UnApprovedFromJson(
        Map<String, dynamic> json) =>
    SupplierDetail_UnApproved(
      CardCode: json['CardCode'] as String?,
      CardName: json['CardName'] as String?,
      GroupName: json['GroupName'] as String?,
      LicTradNum: json['LicTradNum'] as String?,
      RequestedBy: json['RequestedBy'],
      ApprovalStatus: json['ApprovalStatus'] as String?,
    );

Map<String, dynamic> _$SupplierDetail_UnApprovedToJson(
        SupplierDetail_UnApproved instance) =>
    <String, dynamic>{
      'CardCode': instance.CardCode,
      'CardName': instance.CardName,
      'GroupName': instance.GroupName,
      'LicTradNum': instance.LicTradNum,
      'RequestedBy': instance.RequestedBy,
      'ApprovalStatus': instance.ApprovalStatus,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_supplier_approved_modal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetSupplierApprovedModal _$GetSupplierApprovedModalFromJson(
        Map<String, dynamic> json) =>
    GetSupplierApprovedModal(
      bpmasterDetails: (json['bpmasterDetails'] as List<dynamic>)
          .map((e) =>
              SupplierDetail_Approved.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetSupplierApprovedModalToJson(
        GetSupplierApprovedModal instance) =>
    <String, dynamic>{
      'bpmasterDetails': instance.bpmasterDetails,
    };

SupplierDetail_Approved _$SupplierDetail_ApprovedFromJson(
        Map<String, dynamic> json) =>
    SupplierDetail_Approved(
      CardCode: json['CardCode'] as String?,
      CardName: json['CardName'] as String?,
      GroupName: json['GroupName'] as String?,
      LicTradNum: json['LicTradNum'] as String?,
      RequestedBy: json['RequestedBy'],
      ApprovalStatus: json['ApprovalStatus'] as String?,
    );

Map<String, dynamic> _$SupplierDetail_ApprovedToJson(
        SupplierDetail_Approved instance) =>
    <String, dynamic>{
      'CardCode': instance.CardCode,
      'CardName': instance.CardName,
      'GroupName': instance.GroupName,
      'LicTradNum': instance.LicTradNum,
      'RequestedBy': instance.RequestedBy,
      'ApprovalStatus': instance.ApprovalStatus,
    };

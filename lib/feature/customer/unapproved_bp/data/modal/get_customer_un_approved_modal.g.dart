// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_customer_un_approved_modal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCustomerUnApprovedModal _$GetCustomerUnApprovedModalFromJson(
        Map<String, dynamic> json) =>
    GetCustomerUnApprovedModal(
      bpmasterDetails: (json['bpmasterDetails'] as List<dynamic>)
          .map((e) => BpDetail_UN.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetCustomerUnApprovedModalToJson(
        GetCustomerUnApprovedModal instance) =>
    <String, dynamic>{
      'bpmasterDetails': instance.bpmasterDetails,
    };

BpDetail_UN _$BpDetail_UNFromJson(Map<String, dynamic> json) => BpDetail_UN(
      CardCode: json['CardCode'] as String?,
      CardName: json['CardName'] as String?,
      GroupName: json['GroupName'] as String?,
      LicTradNum: json['LicTradNum'] as String?,
      RequestedBy: json['RequestedBy'],
      ApprovalStatus: json['ApprovalStatus'] as String?,
    );

Map<String, dynamic> _$BpDetail_UNToJson(BpDetail_UN instance) =>
    <String, dynamic>{
      'CardCode': instance.CardCode,
      'CardName': instance.CardName,
      'GroupName': instance.GroupName,
      'LicTradNum': instance.LicTradNum,
      'RequestedBy': instance.RequestedBy,
      'ApprovalStatus': instance.ApprovalStatus,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_customer_rejected_modal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCustomerRejectedModal _$GetCustomerRejectedModalFromJson(
        Map<String, dynamic> json) =>
    GetCustomerRejectedModal(
      bpmasterDetails: (json['bpmasterDetails'] as List<dynamic>)
          .map((e) => BpDetail_Rejected.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetCustomerRejectedModalToJson(
        GetCustomerRejectedModal instance) =>
    <String, dynamic>{
      'bpmasterDetails': instance.bpmasterDetails,
    };

BpDetail_Rejected _$BpDetail_RejectedFromJson(Map<String, dynamic> json) =>
    BpDetail_Rejected(
      CardCode: json['CardCode'] as String?,
      CardName: json['CardName'] as String?,
      GroupName: json['GroupName'] as String?,
      LicTradNum: json['LicTradNum'] as String?,
      RequestedBy: json['RequestedBy'],
      ApprovalStatus: json['ApprovalStatus'] as String?,
    );

Map<String, dynamic> _$BpDetail_RejectedToJson(BpDetail_Rejected instance) =>
    <String, dynamic>{
      'CardCode': instance.CardCode,
      'CardName': instance.CardName,
      'GroupName': instance.GroupName,
      'LicTradNum': instance.LicTradNum,
      'RequestedBy': instance.RequestedBy,
      'ApprovalStatus': instance.ApprovalStatus,
    };

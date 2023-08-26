// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_bp_approval_status_modal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetBpApprovalStatusModal _$GetBpApprovalStatusModalFromJson(
        Map<String, dynamic> json) =>
    GetBpApprovalStatusModal(
      bpmasterDetails: (json['bpmasterDetails'] as List<dynamic>)
          .map((e) => BpDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetBpApprovalStatusModalToJson(
        GetBpApprovalStatusModal instance) =>
    <String, dynamic>{
      'bpmasterDetails': instance.bpmasterDetails,
    };

BpDetail _$BpDetailFromJson(Map<String, dynamic> json) => BpDetail(
      CardCode: json['CardCode'] as String?,
      CardName: json['CardName'] as String?,
      GroupName: json['GroupName'] as String?,
      LicTradNum: json['LicTradNum'] as String?,
      RequestedBy: json['RequestedBy'],
      ApprovalStatus: json['ApprovalStatus'] as String?,
    );

Map<String, dynamic> _$BpDetailToJson(BpDetail instance) => <String, dynamic>{
      'CardCode': instance.CardCode,
      'CardName': instance.CardName,
      'GroupName': instance.GroupName,
      'LicTradNum': instance.LicTradNum,
      'RequestedBy': instance.RequestedBy,
      'ApprovalStatus': instance.ApprovalStatus,
    };

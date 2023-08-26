// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_customer_blank_modal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCustomerBlankModal _$GetCustomerBlankModalFromJson(
        Map<String, dynamic> json) =>
    GetCustomerBlankModal(
      bpmasterDetails: (json['bpmasterDetails'] as List<dynamic>)
          .map((e) => BpDetail_Blank.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetCustomerBlankModalToJson(
        GetCustomerBlankModal instance) =>
    <String, dynamic>{
      'bpmasterDetails': instance.bpmasterDetails,
    };

BpDetail_Blank _$BpDetail_BlankFromJson(Map<String, dynamic> json) =>
    BpDetail_Blank(
      CardCode: json['CardCode'] as String?,
      CardName: json['CardName'] as String?,
      GroupName: json['GroupName'] as String?,
      LicTradNum: json['LicTradNum'] as String?,
      RequestedBy: json['RequestedBy'],
      ApprovalStatus: json['ApprovalStatus'] as String?,
    );

Map<String, dynamic> _$BpDetail_BlankToJson(BpDetail_Blank instance) =>
    <String, dynamic>{
      'CardCode': instance.CardCode,
      'CardName': instance.CardName,
      'GroupName': instance.GroupName,
      'LicTradNum': instance.LicTradNum,
      'RequestedBy': instance.RequestedBy,
      'ApprovalStatus': instance.ApprovalStatus,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_item_approval_status_modal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetItemApprovalStatusModal _$GetItemApprovalStatusModalFromJson(
        Map<String, dynamic> json) =>
    GetItemApprovalStatusModal(
      itemmasterDetails: (json['itemmasterDetails'] as List<dynamic>)
          .map((e) => ItemDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetItemApprovalStatusModalToJson(
        GetItemApprovalStatusModal instance) =>
    <String, dynamic>{
      'itemmasterDetails': instance.itemmasterDetails,
    };

ItemDetail _$ItemDetailFromJson(Map<String, dynamic> json) => ItemDetail(
      ItemCode: json['ItemCode'] as String?,
      ItemName: json['ItemName'] as String?,
      GroupName: json['GroupName'] as String?,
      RequestedBy: json['RequestedBy'],
      ApprovalStatus: json['ApprovalStatus'] as String?,
    );

Map<String, dynamic> _$ItemDetailToJson(ItemDetail instance) =>
    <String, dynamic>{
      'ItemCode': instance.ItemCode,
      'ItemName': instance.ItemName,
      'GroupName': instance.GroupName,
      'RequestedBy': instance.RequestedBy,
      'ApprovalStatus': instance.ApprovalStatus,
    };

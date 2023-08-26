// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_item_unApproved_modal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetItemUnApprovedModal _$GetItemUnApprovedModalFromJson(
        Map<String, dynamic> json) =>
    GetItemUnApprovedModal(
      itemmasterDetails: (json['itemmasterDetails'] as List<dynamic>)
          .map((e) => ItemDetail_UnApproved.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetItemUnApprovedModalToJson(
        GetItemUnApprovedModal instance) =>
    <String, dynamic>{
      'itemmasterDetails': instance.itemmasterDetails,
    };

ItemDetail_UnApproved _$ItemDetail_UnApprovedFromJson(
        Map<String, dynamic> json) =>
    ItemDetail_UnApproved(
      ItemCode: json['ItemCode'] as String?,
      ItemName: json['ItemName'] as String?,
      GroupName: json['GroupName'] as String?,
      RequestedBy: json['RequestedBy'],
      ApprovalStatus: json['ApprovalStatus'] as String?,
    );

Map<String, dynamic> _$ItemDetail_UnApprovedToJson(
        ItemDetail_UnApproved instance) =>
    <String, dynamic>{
      'ItemCode': instance.ItemCode,
      'ItemName': instance.ItemName,
      'GroupName': instance.GroupName,
      'RequestedBy': instance.RequestedBy,
      'ApprovalStatus': instance.ApprovalStatus,
    };

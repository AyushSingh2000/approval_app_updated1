// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_item_approved_modal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetItemApprovedModal _$GetItemApprovedModalFromJson(
        Map<String, dynamic> json) =>
    GetItemApprovedModal(
      itemmasterDetails: (json['itemmasterDetails'] as List<dynamic>)
          .map((e) => ItemDetail_Approved.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetItemApprovedModalToJson(
        GetItemApprovedModal instance) =>
    <String, dynamic>{
      'itemmasterDetails': instance.itemmasterDetails,
    };

ItemDetail_Approved _$ItemDetail_ApprovedFromJson(Map<String, dynamic> json) =>
    ItemDetail_Approved(
      ItemCode: json['ItemCode'] as String?,
      ItemName: json['ItemName'] as String?,
      GroupName: json['GroupName'] as String?,
      RequestedBy: json['RequestedBy'],
      ApprovalStatus: json['ApprovalStatus'] as String?,
    );

Map<String, dynamic> _$ItemDetail_ApprovedToJson(
        ItemDetail_Approved instance) =>
    <String, dynamic>{
      'ItemCode': instance.ItemCode,
      'ItemName': instance.ItemName,
      'GroupName': instance.GroupName,
      'RequestedBy': instance.RequestedBy,
      'ApprovalStatus': instance.ApprovalStatus,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_item_rejected_modal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetItemRejectedModal _$GetItemRejectedModalFromJson(
        Map<String, dynamic> json) =>
    GetItemRejectedModal(
      itemmasterDetails: (json['itemmasterDetails'] as List<dynamic>)
          .map((e) => ItemDetail_Rejected.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetItemRejectedModalToJson(
        GetItemRejectedModal instance) =>
    <String, dynamic>{
      'itemmasterDetails': instance.itemmasterDetails,
    };

ItemDetail_Rejected _$ItemDetail_RejectedFromJson(Map<String, dynamic> json) =>
    ItemDetail_Rejected(
      ItemCode: json['ItemCode'] as String?,
      ItemName: json['ItemName'] as String?,
      GroupName: json['GroupName'] as String?,
      RequestedBy: json['RequestedBy'],
      ApprovalStatus: json['ApprovalStatus'] as String?,
    );

Map<String, dynamic> _$ItemDetail_RejectedToJson(
        ItemDetail_Rejected instance) =>
    <String, dynamic>{
      'ItemCode': instance.ItemCode,
      'ItemName': instance.ItemName,
      'GroupName': instance.GroupName,
      'RequestedBy': instance.RequestedBy,
      'ApprovalStatus': instance.ApprovalStatus,
    };

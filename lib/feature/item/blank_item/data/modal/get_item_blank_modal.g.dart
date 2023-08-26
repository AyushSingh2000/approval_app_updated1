// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_item_blank_modal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetItemBlankModal _$GetItemBlankModalFromJson(Map<String, dynamic> json) =>
    GetItemBlankModal(
      itemmasterDetails: (json['itemmasterDetails'] as List<dynamic>)
          .map((e) => ItemDetail_Blank.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetItemBlankModalToJson(GetItemBlankModal instance) =>
    <String, dynamic>{
      'itemmasterDetails': instance.itemmasterDetails,
    };

ItemDetail_Blank _$ItemDetail_BlankFromJson(Map<String, dynamic> json) =>
    ItemDetail_Blank(
      ItemCode: json['ItemCode'] as String?,
      ItemName: json['ItemName'] as String?,
      GroupName: json['GroupName'] as String?,
      RequestedBy: json['RequestedBy'],
      ApprovalStatus: json['ApprovalStatus'] as String?,
    );

Map<String, dynamic> _$ItemDetail_BlankToJson(ItemDetail_Blank instance) =>
    <String, dynamic>{
      'ItemCode': instance.ItemCode,
      'ItemName': instance.ItemName,
      'GroupName': instance.GroupName,
      'RequestedBy': instance.RequestedBy,
      'ApprovalStatus': instance.ApprovalStatus,
    };

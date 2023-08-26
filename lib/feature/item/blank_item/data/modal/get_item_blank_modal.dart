import 'package:json_annotation/json_annotation.dart';

part 'get_item_blank_modal.g.dart';

@JsonSerializable()
class GetItemBlankModal {
  final List<ItemDetail_Blank> itemmasterDetails;

  GetItemBlankModal({required this.itemmasterDetails});

  factory GetItemBlankModal.fromJson(Map<String, dynamic> json) =>
      _$GetItemBlankModalFromJson(json);

  Map<String, dynamic> toJson() => _$GetItemBlankModalToJson(this);
}

@JsonSerializable()
class ItemDetail_Blank {
  String? ItemCode;
  String? ItemName;
  String? GroupName;
  dynamic RequestedBy;
  String? ApprovalStatus;

  ItemDetail_Blank(
      {this.ItemCode,
      this.ItemName,
      this.GroupName,
      this.RequestedBy,
      this.ApprovalStatus});

  factory ItemDetail_Blank.fromJson(Map<String, dynamic> json) =>
      _$ItemDetail_BlankFromJson(json);

  Map<String, dynamic> toJson() => _$ItemDetail_BlankToJson(this);
}

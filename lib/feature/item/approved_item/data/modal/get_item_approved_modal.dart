import 'package:json_annotation/json_annotation.dart';

part 'get_item_approved_modal.g.dart';

@JsonSerializable()
class GetItemApprovedModal {
  final List<ItemDetail_Approved> itemmasterDetails;

  GetItemApprovedModal({required this.itemmasterDetails});

  factory GetItemApprovedModal.fromJson(Map<String, dynamic> json) =>
      _$GetItemApprovedModalFromJson(json);

  Map<String, dynamic> toJson() => _$GetItemApprovedModalToJson(this);
}

@JsonSerializable()
class ItemDetail_Approved {
  String? ItemCode;
  String? ItemName;
  String? GroupName;
  dynamic RequestedBy;
  String? ApprovalStatus;

  ItemDetail_Approved(
      {this.ItemCode,
      this.ItemName,
      this.GroupName,
      this.RequestedBy,
      this.ApprovalStatus});

  factory ItemDetail_Approved.fromJson(Map<String, dynamic> json) =>
      _$ItemDetail_ApprovedFromJson(json);

  Map<String, dynamic> toJson() => _$ItemDetail_ApprovedToJson(this);
}

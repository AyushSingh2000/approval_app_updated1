import 'package:json_annotation/json_annotation.dart';

part 'get_item_unApproved_modal.g.dart';

@JsonSerializable()
class GetItemUnApprovedModal {
  final List<ItemDetail_UnApproved> itemmasterDetails;

  GetItemUnApprovedModal({required this.itemmasterDetails});

  factory GetItemUnApprovedModal.fromJson(Map<String, dynamic> json) =>
      _$GetItemUnApprovedModalFromJson(json);

  Map<String, dynamic> toJson() => _$GetItemUnApprovedModalToJson(this);
}

@JsonSerializable()
class ItemDetail_UnApproved {
  String? ItemCode;
  String? ItemName;
  String? GroupName;
  dynamic RequestedBy;
  String? ApprovalStatus;

  ItemDetail_UnApproved(
      {this.ItemCode,
      this.ItemName,
      this.GroupName,
      this.RequestedBy,
      this.ApprovalStatus});

  factory ItemDetail_UnApproved.fromJson(Map<String, dynamic> json) =>
      _$ItemDetail_UnApprovedFromJson(json);

  Map<String, dynamic> toJson() => _$ItemDetail_UnApprovedToJson(this);
}

import 'package:json_annotation/json_annotation.dart';

part 'get_item_approval_status_modal.g.dart';

@JsonSerializable()
class GetItemApprovalStatusModal {
  final List<ItemDetail> itemmasterDetails;

  GetItemApprovalStatusModal({required this.itemmasterDetails});

  factory GetItemApprovalStatusModal.fromJson(Map<String, dynamic> json) =>
      _$GetItemApprovalStatusModalFromJson(json);

  Map<String, dynamic> toJson() => _$GetItemApprovalStatusModalToJson(this);
}

@JsonSerializable()
class ItemDetail {
  String? ItemCode;
  String? ItemName;
  String? GroupName;
  dynamic RequestedBy;
  String? ApprovalStatus;

  ItemDetail(
      {this.ItemCode,
      this.ItemName,
      this.GroupName,
      this.RequestedBy,
      this.ApprovalStatus});

  factory ItemDetail.fromJson(Map<String, dynamic> json) =>
      _$ItemDetailFromJson(json);

  Map<String, dynamic> toJson() => _$ItemDetailToJson(this);
}

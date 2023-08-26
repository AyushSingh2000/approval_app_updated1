import 'package:json_annotation/json_annotation.dart';

part 'get_item_rejected_modal.g.dart';

@JsonSerializable()
class GetItemRejectedModal {
  final List<ItemDetail_Rejected> itemmasterDetails;

  GetItemRejectedModal({required this.itemmasterDetails});

  factory GetItemRejectedModal.fromJson(Map<String, dynamic> json) =>
      _$GetItemRejectedModalFromJson(json);

  Map<String, dynamic> toJson() => _$GetItemRejectedModalToJson(this);
}

@JsonSerializable()
class ItemDetail_Rejected {
  String? ItemCode;
  String? ItemName;
  String? GroupName;
  dynamic RequestedBy;
  String? ApprovalStatus;

  ItemDetail_Rejected(
      {this.ItemCode,
      this.ItemName,
      this.GroupName,
      this.RequestedBy,
      this.ApprovalStatus});

  factory ItemDetail_Rejected.fromJson(Map<String, dynamic> json) =>
      _$ItemDetail_RejectedFromJson(json);

  Map<String, dynamic> toJson() => _$ItemDetail_RejectedToJson(this);
}

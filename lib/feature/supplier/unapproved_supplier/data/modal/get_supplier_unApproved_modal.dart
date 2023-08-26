import 'package:json_annotation/json_annotation.dart';

part 'get_supplier_unApproved_modal.g.dart';

@JsonSerializable()
class GetSupplierUnApprovedModal {
  final List<SupplierDetail_UnApproved> bpmasterDetails;

  GetSupplierUnApprovedModal({required this.bpmasterDetails});

  factory GetSupplierUnApprovedModal.fromJson(Map<String, dynamic> json) =>
      _$GetSupplierUnApprovedModalFromJson(json);

  Map<String, dynamic> toJson() => _$GetSupplierUnApprovedModalToJson(this);
}

@JsonSerializable()
class SupplierDetail_UnApproved {
  String? CardCode;
  String? CardName;
  String? GroupName;
  String? LicTradNum;
  dynamic RequestedBy;
  String? ApprovalStatus;

  SupplierDetail_UnApproved(
      {this.CardCode,
      this.CardName,
      this.GroupName,
      this.LicTradNum,
      this.RequestedBy,
      this.ApprovalStatus});

  factory SupplierDetail_UnApproved.fromJson(Map<String, dynamic> json) =>
      _$SupplierDetail_UnApprovedFromJson(json);

  Map<String, dynamic> toJson() => _$SupplierDetail_UnApprovedToJson(this);
}

import 'package:json_annotation/json_annotation.dart';

part 'get_supplier_approved_modal.g.dart';

@JsonSerializable()
class GetSupplierApprovedModal {
  final List<SupplierDetail_Approved> bpmasterDetails;

  GetSupplierApprovedModal({required this.bpmasterDetails});

  factory GetSupplierApprovedModal.fromJson(Map<String, dynamic> json) =>
      _$GetSupplierApprovedModalFromJson(json);

  Map<String, dynamic> toJson() => _$GetSupplierApprovedModalToJson(this);
}

@JsonSerializable()
class SupplierDetail_Approved {
  String? CardCode;
  String? CardName;
  String? GroupName;
  String? LicTradNum;
  dynamic RequestedBy;
  String? ApprovalStatus;

  SupplierDetail_Approved(
      {this.CardCode,
      this.CardName,
      this.GroupName,
      this.LicTradNum,
      this.RequestedBy,
      this.ApprovalStatus});

  factory SupplierDetail_Approved.fromJson(Map<String, dynamic> json) =>
      _$SupplierDetail_ApprovedFromJson(json);

  Map<String, dynamic> toJson() => _$SupplierDetail_ApprovedToJson(this);
}

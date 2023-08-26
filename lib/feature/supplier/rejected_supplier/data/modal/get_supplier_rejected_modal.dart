import 'package:json_annotation/json_annotation.dart';

part 'get_supplier_rejected_modal.g.dart';

@JsonSerializable()
class GetSupplierRejectedModal {
  final List<SupplierDetail_Rejected> bpmasterDetails;

  GetSupplierRejectedModal({required this.bpmasterDetails});

  factory GetSupplierRejectedModal.fromJson(Map<String, dynamic> json) =>
      _$GetSupplierRejectedModalFromJson(json);

  Map<String, dynamic> toJson() => _$GetSupplierRejectedModalToJson(this);
}

@JsonSerializable()
class SupplierDetail_Rejected {
  String? CardCode;
  String? CardName;
  String? GroupName;
  String? LicTradNum;
  dynamic RequestedBy;
  String? ApprovalStatus;

  SupplierDetail_Rejected(
      {this.CardCode,
      this.CardName,
      this.GroupName,
      this.LicTradNum,
      this.RequestedBy,
      this.ApprovalStatus});

  factory SupplierDetail_Rejected.fromJson(Map<String, dynamic> json) =>
      _$SupplierDetail_RejectedFromJson(json);

  Map<String, dynamic> toJson() => _$SupplierDetail_RejectedToJson(this);
}

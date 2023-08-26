import 'package:json_annotation/json_annotation.dart';

part 'get_supplier_blank_modal.g.dart';

@JsonSerializable()
class GetSupplierBlankModal {
  final List<SupplierDetail_Blank> bpmasterDetails;

  GetSupplierBlankModal({required this.bpmasterDetails});

  factory GetSupplierBlankModal.fromJson(Map<String, dynamic> json) =>
      _$GetSupplierBlankModalFromJson(json);

  Map<String, dynamic> toJson() => _$GetSupplierBlankModalToJson(this);
}

@JsonSerializable()
class SupplierDetail_Blank {
  String? CardCode;
  String? CardName;
  String? GroupName;
  String? LicTradNum;
  dynamic RequestedBy;
  String? ApprovalStatus;

  SupplierDetail_Blank(
      {this.CardCode,
      this.CardName,
      this.GroupName,
      this.LicTradNum,
      this.RequestedBy,
      this.ApprovalStatus});

  factory SupplierDetail_Blank.fromJson(Map<String, dynamic> json) =>
      _$SupplierDetail_BlankFromJson(json);

  Map<String, dynamic> toJson() => _$SupplierDetail_BlankToJson(this);
}

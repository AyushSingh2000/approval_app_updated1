import 'package:json_annotation/json_annotation.dart';

part 'get_supplier_blank_modal.g.dart';

@JsonSerializable()
class GetCustomerBlankModal {
  final List<BpDetail_Blank> bpmasterDetails;

  GetCustomerBlankModal({required this.bpmasterDetails});

  factory GetCustomerBlankModal.fromJson(Map<String, dynamic> json) =>
      _$GetCustomerBlankModalFromJson(json);

  Map<String, dynamic> toJson() => _$GetCustomerBlankModalToJson(this);
}

@JsonSerializable()
class BpDetail_Blank {
  String? CardCode;
  String? CardName;
  String? GroupName;
  String? LicTradNum;
  dynamic RequestedBy;
  String? ApprovalStatus;

  BpDetail_Blank(
      {this.CardCode,
      this.CardName,
      this.GroupName,
      this.LicTradNum,
      this.RequestedBy,
      this.ApprovalStatus});

  factory BpDetail_Blank.fromJson(Map<String, dynamic> json) =>
      _$BpDetail_BlankFromJson(json);

  Map<String, dynamic> toJson() => _$BpDetail_BlankToJson(this);
}

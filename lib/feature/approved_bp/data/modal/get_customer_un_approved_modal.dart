import 'package:json_annotation/json_annotation.dart';

part 'get_customer_un_approved_modal.g.dart';

@JsonSerializable()
class GetCustomerUnApprovedModal {
  final List<BpDetail_UN> bpmasterDetails;

  GetCustomerUnApprovedModal({required this.bpmasterDetails});

  factory GetCustomerUnApprovedModal.fromJson(Map<String, dynamic> json) =>
      _$GetCustomerUnApprovedModalFromJson(json);

  Map<String, dynamic> toJson() => _$GetCustomerUnApprovedModalToJson(this);
}

@JsonSerializable()
class BpDetail_UN {
  String? CardCode;
  String? CardName;
  String? GroupName;
  String? LicTradNum;
  dynamic RequestedBy;
  String? ApprovalStatus;

  BpDetail_UN(
      {this.CardCode,
      this.CardName,
      this.GroupName,
      this.LicTradNum,
      this.RequestedBy,
      this.ApprovalStatus});

  factory BpDetail_UN.fromJson(Map<String, dynamic> json) =>
      _$BpDetail_UNFromJson(json);

  Map<String, dynamic> toJson() => _$BpDetail_UNToJson(this);
}

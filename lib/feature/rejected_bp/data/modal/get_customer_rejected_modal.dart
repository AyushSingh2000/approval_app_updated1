import 'package:json_annotation/json_annotation.dart';

part 'get_customer_rejected_modal.g.dart';

@JsonSerializable()
class GetCustomerRejectedModal {
  final List<BpDetail_Rejected> bpmasterDetails;

  GetCustomerRejectedModal({required this.bpmasterDetails});

  factory GetCustomerRejectedModal.fromJson(Map<String, dynamic> json) =>
      _$GetCustomerRejectedModalFromJson(json);

  Map<String, dynamic> toJson() => _$GetCustomerRejectedModalToJson(this);
}

@JsonSerializable()
class BpDetail_Rejected {
  String? CardCode;
  String? CardName;
  String? GroupName;
  String? LicTradNum;
  dynamic RequestedBy;
  String? ApprovalStatus;

  BpDetail_Rejected(
      {this.CardCode,
      this.CardName,
      this.GroupName,
      this.LicTradNum,
      this.RequestedBy,
      this.ApprovalStatus});

  factory BpDetail_Rejected.fromJson(Map<String, dynamic> json) =>
      _$BpDetail_RejectedFromJson(json);

  Map<String, dynamic> toJson() => _$BpDetail_RejectedToJson(this);
}

import 'package:json_annotation/json_annotation.dart';

part 'get_bp_approval_status_modal.g.dart';

@JsonSerializable()
class GetBpApprovalStatusModal {
  final List<BpDetail> bpmasterDetails;

  GetBpApprovalStatusModal({required this.bpmasterDetails});

  factory GetBpApprovalStatusModal.fromJson(Map<String, dynamic> json) =>
      _$GetBpApprovalStatusModalFromJson(json);

  Map<String, dynamic> toJson() => _$GetBpApprovalStatusModalToJson(this);
}

@JsonSerializable()
class BpDetail {
  String? CardCode;
  String? CardName;
  String? GroupName;
  String? LicTradNum;
  dynamic RequestedBy;
  String? ApprovalStatus;

  BpDetail(
      {this.CardCode,
      this.CardName,
      this.GroupName,
      this.LicTradNum,
      this.RequestedBy,
      this.ApprovalStatus});

  factory BpDetail.fromJson(Map<String, dynamic> json) =>
      _$BpDetailFromJson(json);

  Map<String, dynamic> toJson() => _$BpDetailToJson(this);
}

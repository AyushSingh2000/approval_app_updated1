import 'package:json_annotation/json_annotation.dart';

part 'get_item_master_details_modal.g.dart';

@JsonSerializable()
class GetItemDetailsModal {
  final List<ItemDetail_code> itemmasterDetails;

  GetItemDetailsModal({required this.itemmasterDetails});

  factory GetItemDetailsModal.fromJson(Map<String, dynamic> json) =>
      _$GetItemDetailsModalFromJson(json);

  Map<String, dynamic> toJson() => _$GetItemDetailsModalToJson(this);
}

@JsonSerializable()
class ItemDetail_code {
  String? ItemCode;
  String? ItemName;
  String? FrgnName;
  int? ItmsGrpCod;
  String? ItmsGrpNam;
  String? BuyUnitMsr;
  String? SalUnitMsr;
  String? InvntryUom;
  String? GroupName;
  String? PrchseItem;
  String? SellItem;
  String? InvntItem;
  String? ManSerNum;
  String? ManBtchNum;
  String? MngMethod;
  String? MngMethod1;
  String? ItemClass;
  String? ItmClassNm;
  String? validFor;
  String? frozenFor;
  String? CreateDate;
  int? CreateTS;
  String? UpdateDate;
  int? UpdateTS;

  ItemDetail_code({
    this.ItemCode,
    this.ItemName,
    this.FrgnName,
    this.ItmsGrpCod,
    this.ItmsGrpNam,
    this.BuyUnitMsr,
    this.SalUnitMsr,
    this.InvntryUom,
    this.GroupName,
    this.PrchseItem,
    this.SellItem,
    this.InvntItem,
    this.ManSerNum,
    this.ManBtchNum,
    this.MngMethod,
    this.MngMethod1,
    this.ItemClass,
    this.ItmClassNm,
    this.validFor,
    this.frozenFor,
    this.CreateDate,
    this.CreateTS,
    this.UpdateDate,
    this.UpdateTS,
  });

  factory ItemDetail_code.fromJson(Map<String, dynamic> json) =>
      _$ItemDetail_codeFromJson(json);

  Map<String, dynamic> toJson() => _$ItemDetail_codeToJson(this);
}

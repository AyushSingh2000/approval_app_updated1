// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_item_master_details_modal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetItemDetailsModal _$GetItemDetailsModalFromJson(Map<String, dynamic> json) =>
    GetItemDetailsModal(
      itemmasterDetails: (json['itemmasterDetails'] as List<dynamic>)
          .map((e) => ItemDetail_code.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetItemDetailsModalToJson(
        GetItemDetailsModal instance) =>
    <String, dynamic>{
      'itemmasterDetails': instance.itemmasterDetails,
    };

ItemDetail_code _$ItemDetail_codeFromJson(Map<String, dynamic> json) =>
    ItemDetail_code(
      ItemCode: json['ItemCode'] as String?,
      ItemName: json['ItemName'] as String?,
      FrgnName: json['FrgnName'] as String?,
      ItmsGrpCod: json['ItmsGrpCod'] as int?,
      ItmsGrpNam: json['ItmsGrpNam'] as String?,
      BuyUnitMsr: json['BuyUnitMsr'] as String?,
      SalUnitMsr: json['SalUnitMsr'] as String?,
      InvntryUom: json['InvntryUom'] as String?,
      GroupName: json['GroupName'] as String?,
      PrchseItem: json['PrchseItem'] as String?,
      SellItem: json['SellItem'] as String?,
      InvntItem: json['InvntItem'] as String?,
      ManSerNum: json['ManSerNum'] as String?,
      ManBtchNum: json['ManBtchNum'] as String?,
      MngMethod: json['MngMethod'] as String?,
      MngMethod1: json['MngMethod1'] as String?,
      ItemClass: json['ItemClass'] as String?,
      ItmClassNm: json['ItmClassNm'] as String?,
      validFor: json['validFor'] as String?,
      frozenFor: json['frozenFor'] as String?,
      CreateDate: json['CreateDate'] as String?,
      CreateTS: json['CreateTS'] as int?,
      UpdateDate: json['UpdateDate'] as String?,
      UpdateTS: json['UpdateTS'] as int?,
    );

Map<String, dynamic> _$ItemDetail_codeToJson(ItemDetail_code instance) =>
    <String, dynamic>{
      'ItemCode': instance.ItemCode,
      'ItemName': instance.ItemName,
      'FrgnName': instance.FrgnName,
      'ItmsGrpCod': instance.ItmsGrpCod,
      'ItmsGrpNam': instance.ItmsGrpNam,
      'BuyUnitMsr': instance.BuyUnitMsr,
      'SalUnitMsr': instance.SalUnitMsr,
      'InvntryUom': instance.InvntryUom,
      'GroupName': instance.GroupName,
      'PrchseItem': instance.PrchseItem,
      'SellItem': instance.SellItem,
      'InvntItem': instance.InvntItem,
      'ManSerNum': instance.ManSerNum,
      'ManBtchNum': instance.ManBtchNum,
      'MngMethod': instance.MngMethod,
      'MngMethod1': instance.MngMethod1,
      'ItemClass': instance.ItemClass,
      'ItmClassNm': instance.ItmClassNm,
      'validFor': instance.validFor,
      'frozenFor': instance.frozenFor,
      'CreateDate': instance.CreateDate,
      'CreateTS': instance.CreateTS,
      'UpdateDate': instance.UpdateDate,
      'UpdateTS': instance.UpdateTS,
    };

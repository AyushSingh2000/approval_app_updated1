// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ItemSubstitutionModel {
  String CardCode;
  String DisplayBPCatalogNumber;
  String ItemCode;
  String Substitute;
  String U_VSPBPD;
  String U_VSPTS;

  ItemSubstitutionModel({
    required this.CardCode,
    required this.DisplayBPCatalogNumber,
    required this.ItemCode,
    required this.Substitute,
    required this.U_VSPBPD,
    required this.U_VSPTS,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'CardCode': CardCode,
      'DisplayBPCatalogNumber': DisplayBPCatalogNumber,
      'ItemCode': ItemCode,
      'Substitute': Substitute,
      'U_VSPBPD': U_VSPBPD,
      'U_VSPTS': U_VSPTS,
    };
  }

  factory ItemSubstitutionModel.fromMap(Map<String, dynamic> map) {
    return ItemSubstitutionModel(
      CardCode: map['CardCode'] as String,
      DisplayBPCatalogNumber: map['DisplayBPCatalogNumber'] as String,
      ItemCode: map['ItemCode'] as String,
      Substitute: map['Substitute'] as String,
      U_VSPBPD: map['U_VSPBPD'] as String,
      U_VSPTS: map['U_VSPTS'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemSubstitutionModel.fromJson(String source) =>
      ItemSubstitutionModel.fromMap(
          json.decode(source) as Map<String, dynamic>);
}

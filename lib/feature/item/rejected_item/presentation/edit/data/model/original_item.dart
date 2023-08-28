// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class EditOriginalItemModel {
  List<EditAlternativeItemModel> AlternativeItems;
  String ItemCode;
  String ItemName;

  EditOriginalItemModel({
    required this.AlternativeItems,
    required this.ItemCode,
    required this.ItemName,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'AlternativeItems': AlternativeItems.map((x) => x.toMap()).toList(),
      'ItemCode': ItemCode,
      'ItemName': ItemName,
    };
  }

  factory EditOriginalItemModel.fromMap(Map<String, dynamic> map) {
    return EditOriginalItemModel(
      AlternativeItems: List<EditAlternativeItemModel>.from(
        (map['AlternativeItems'] as List<int>).map<EditAlternativeItemModel>(
          (x) => EditAlternativeItemModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      ItemCode: map['itemCode'] as String,
      ItemName: map['itemName'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory EditOriginalItemModel.fromJson(String source) =>
      EditOriginalItemModel.fromMap(
          json.decode(source) as Map<String, dynamic>);
}

class EditAlternativeItemModel {
  String AlternativeItemCode;
  int MatchFactor;
  String Remarks;

  EditAlternativeItemModel({
    required this.AlternativeItemCode,
    required this.MatchFactor,
    required this.Remarks,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'AlternativeItemCode': AlternativeItemCode,
      'MatchFactor': MatchFactor,
      'Remarks': Remarks,
    };
  }

  factory EditAlternativeItemModel.fromMap(Map<String, dynamic> map) {
    return EditAlternativeItemModel(
      AlternativeItemCode: map['AlternativeItemCode'] as String,
      MatchFactor: map['MatchFactor'] as int,
      Remarks: map['Remarks'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory EditAlternativeItemModel.fromJson(String source) =>
      EditAlternativeItemModel.fromMap(
          json.decode(source) as Map<String, dynamic>);
}

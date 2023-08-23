// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class OriginalItemModel {
  List<AlternativeItemModel> AlternativeItems;
  String ItemCode;
  String ItemName;

  OriginalItemModel({
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

  factory OriginalItemModel.fromMap(Map<String, dynamic> map) {
    return OriginalItemModel(
      AlternativeItems: List<AlternativeItemModel>.from(
        (map['AlternativeItems'] as List<int>).map<AlternativeItemModel>(
          (x) => AlternativeItemModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      ItemCode: map['itemCode'] as String,
      ItemName: map['itemName'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory OriginalItemModel.fromJson(String source) =>
      OriginalItemModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class AlternativeItemModel {
  String AlternativeItemCode;
  int MatchFactor;
  String Remarks;

  AlternativeItemModel({
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

  factory AlternativeItemModel.fromMap(Map<String, dynamic> map) {
    return AlternativeItemModel(
      AlternativeItemCode: map['AlternativeItemCode'] as String,
      MatchFactor: map['MatchFactor'] as int,
      Remarks: map['Remarks'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AlternativeItemModel.fromJson(String source) =>
      AlternativeItemModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

// part 'login_model.g.dart';

@JsonSerializable()
class LoginModel {
  final String CompanyDB;
  final String UserName;
  final String Password;

  LoginModel({
    required this.CompanyDB,
    required this.UserName,
    required this.Password,
  });

  // factory LoginModel.fromJson(Map<String, dynamic> json) =>
  //     _$LoginModelFromJson(json);

  // Map<String, dynamic> toJson() => _$LoginModelToJson(this);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'CompanyDB': CompanyDB,
      'UserName': UserName,
      'Password': Password,
    };
  }

  factory LoginModel.fromMap(Map<String, dynamic> map) {
    return LoginModel(
      CompanyDB: map['CompanyDB'] as String,
      UserName: map['UserName'] as String,
      Password: map['Password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginModel.fromJson(String source) => LoginModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

// // GENERATED CODE - DO NOT MODIFY BY HAND
//
// part of 'BP_post.dart';
//
// // **************************************************************************
// // JsonSerializableGenerator
// // **************************************************************************
//
// BP_PostModel _$BP_PostModelFromJson(Map<String, dynamic> json) => BP_PostModel(
//       Series: json['Series'] as String?,
//       CardName: json['CardName'] as String?,
//       CardType: json['CardType'] as String?,
//       CardForeignName: json['CardForeignName'] as String?,
//       GroupCode: json['GroupCode'] as String?,
//       Currency: json['Currency'] as String?,
//       FederalTaxID: json['FederalTaxID'] as String?,
//       SalesPersonCode: json['SalesPersonCode'] as String?,
//       Phone1: json['Phone1'] as String?,
//       Cellular: json['Cellular'] as String?,
//       EmailAddress: json['EmailAddress'] as String?,
//       Website: json['Website'] as String?,
//       U_ARADDR: json['U_ARADDR'] as String?,
//       U_TRPAPPST: json['U_TRPAPPST'] as String?,
//       U_TRPCRBY: json['U_TRPCRBY'] as String?,
//       BPAddresses: (json['BPAddresses'] as List<dynamic>)
//           .map((e) => bPAddresses.fromJson(e as Map<String, dynamic>))
//           .toList(),
//       ContactEmployees: (json['ContactEmployees'] as List<dynamic>)
//           .map((e) => contactEmployees.fromJson(e as Map<String, dynamic>))
//           .toList(),
//     );
//
// Map<String, dynamic> _$BP_PostModelToJson(BP_PostModel instance) =>
//     <String, dynamic>{
//       'Series': instance.Series,
//       'CardName': instance.CardName,
//       'CardType': instance.CardType,
//       'CardForeignName': instance.CardForeignName,
//       'GroupCode': instance.GroupCode,
//       'Currency': instance.Currency,
//       'FederalTaxID': instance.FederalTaxID,
//       'SalesPersonCode': instance.SalesPersonCode,
//       'Phone1': instance.Phone1,
//       'Cellular': instance.Cellular,
//       'EmailAddress': instance.EmailAddress,
//       'Website': instance.Website,
//       'U_ARADDR': instance.U_ARADDR,
//       'U_TRPAPPST': instance.U_TRPAPPST,
//       'U_TRPCRBY': instance.U_TRPCRBY,
//       'BPAddresses': instance.BPAddresses,
//       'ContactEmployees': instance.ContactEmployees,
//     };
//
// bPAddresses _$bPAddressesFromJson(Map<String, dynamic> json) => bPAddresses(
//       AddressName: json['AddressName'] as String,
//       AddressType: json['AddressType'] as String,
//       AddressName2: json['AddressName2'] as String,
//       AddressName3: json['AddressName3'] as String,
//       BuildingFloorRoom: json['BuildingFloorRoom'] as String,
//       Street: json['Street'] as String?,
//       Block: json['Block'] as String?,
//       ZipCode: json['ZipCode'] as String?,
//       City: json['City'] as String?,
//       Country: json['Country'] as String,
//       State: json['State'] as String?,
//       U_SCCode: json['U_SCCode'] as String?,
//     );
//
// Map<String, dynamic> _$bPAddressesToJson(bPAddresses instance) =>
//     <String, dynamic>{
//       'AddressName': instance.AddressName,
//       'AddressType': instance.AddressType,
//       'AddressName2': instance.AddressName2,
//       'AddressName3': instance.AddressName3,
//       'BuildingFloorRoom': instance.BuildingFloorRoom,
//       'Street': instance.Street,
//       'Block': instance.Block,
//       'ZipCode': instance.ZipCode,
//       'City': instance.City,
//       'Country': instance.Country,
//       'State': instance.State,
//       'U_SCCode': instance.U_SCCode,
//     };
//
// contactEmployees _$contactEmployeesFromJson(Map<String, dynamic> json) =>
//     contactEmployees(
//       CardCode: json['CardCode'] as String?,
//       Title: json['Title'] as String?,
//       FirstName: json['FirstName'] as String,
//       MiddleName: json['MiddleName'] as String?,
//       LastName: json['LastName'] as String?,
//       Name: json['Name'] as String,
//       Position: json['Position'] as String,
//       Address: json['Address'] as String?,
//       Phone1: json['Phone1'] as String,
//       MobilePhone: json['MobilePhone'] as String?,
//       E_Mail: json['E_Mail'] as String?,
//       DateOfBirth: json['DateOfBirth'] as String?,
//       Active: json['Active'] as String,
//     );
//
// Map<String, dynamic> _$contactEmployeesToJson(contactEmployees instance) =>
//     <String, dynamic>{
//       'CardCode': instance.CardCode,
//       'Title': instance.Title,
//       'FirstName': instance.FirstName,
//       'MiddleName': instance.MiddleName,
//       'LastName': instance.LastName,
//       'Name': instance.Name,
//       'Position': instance.Position,
//       'Address': instance.Address,
//       'Phone1': instance.Phone1,
//       'MobilePhone': instance.MobilePhone,
//       'E_Mail': instance.E_Mail,
//       'DateOfBirth': instance.DateOfBirth,
//       'Active': instance.Active,
//     };

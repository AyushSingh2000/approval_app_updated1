// import 'package:json_annotation/json_annotation.dart';
//
// part 'BP_post.g.dart';
//
// @JsonSerializable()
// class BP_PostModel {
//   String? Series;
//   String? CardName;
//   String? CardType;
//   String? CardForeignName;
//   String? GroupCode;
//   String? Currency;
//   String? FederalTaxID;
//   String? SalesPersonCode;
//   String? Phone1;
//   String? Cellular;
//   String? EmailAddress;
//   String? Website;
//   String? U_ARADDR;
//   String? U_TRPAPPST;
//   String? U_TRPCRBY;
//   List<bPAddresses> BPAddresses;
//   List<contactEmployees> ContactEmployees;
//
//   BP_PostModel(
//       {this.Series,
//       this.CardName,
//       this.CardType,
//       this.CardForeignName,
//       this.GroupCode,
//       this.Currency,
//       this.FederalTaxID,
//       this.SalesPersonCode,
//       this.Phone1,
//       this.Cellular,
//       this.EmailAddress,
//       this.Website,
//       this.U_ARADDR,
//       this.U_TRPAPPST,
//       this.U_TRPCRBY,
//       required this.BPAddresses,
//       required this.ContactEmployees});
//
//   factory BP_PostModel.fromJson(Map<String, dynamic> json) =>
//       _$BP_PostModelFromJson(json);
//   Map<String, dynamic> toJson() => _$BP_PostModelToJson(this);
// }
//
// @JsonSerializable()
// class bPAddresses {
//   String AddressName;
//   String AddressType;
//   String AddressName2;
//   String AddressName3;
//   String BuildingFloorRoom;
//   String? Street;
//   String? Block;
//   String? ZipCode;
//   String? City;
//   String Country;
//   String? State;
//   String? U_SCCode;
//
//   bPAddresses(
//       {required this.AddressName,
//       required this.AddressType,
//       required this.AddressName2,
//       required this.AddressName3,
//       required this.BuildingFloorRoom,
//       this.Street,
//       this.Block,
//       this.ZipCode,
//       this.City,
//       required this.Country,
//       this.State,
//       this.U_SCCode});
//   factory bPAddresses.fromJson(Map<String, dynamic> json) =>
//       _$bPAddressesFromJson(json);
//   Map<String, dynamic> toJson() => _$bPAddressesToJson(this);
// }
//
// @JsonSerializable()
// class contactEmployees {
//   String? CardCode;
//   String? Title;
//   String FirstName;
//   String? MiddleName;
//   String? LastName;
//   String Name;
//   String Position;
//   String? Address;
//   String Phone1;
//   String? MobilePhone;
//   String? E_Mail;
//   String? DateOfBirth;
//   String Active;
//
//   contactEmployees(
//       {this.CardCode,
//       this.Title,
//       required this.FirstName,
//       this.MiddleName,
//       this.LastName,
//       required this.Name,
//       required this.Position,
//       this.Address,
//       required this.Phone1,
//       this.MobilePhone,
//       this.E_Mail,
//       this.DateOfBirth,
//       required this.Active});
//   factory contactEmployees.fromJson(Map<String, dynamic> json) =>
//       _$contactEmployeesFromJson(json);
//   Map<String, dynamic> toJson() => _$contactEmployeesToJson(this);
// }

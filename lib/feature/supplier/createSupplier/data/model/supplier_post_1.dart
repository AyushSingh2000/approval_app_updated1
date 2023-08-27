// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class BP_PostModel_Supplier {
  double? Series;
  String? CardName;
  String? CardType;
  String? CardForeignName;
  double? GroupCode;
  String? Currency;
  String? FederalTaxID;
  String? SalesPersonCode;
  String? Phone1;
  String? Cellular;
  String? EmailAddress;
  String? Website;
  String? U_ARADDR;
  String? U_TRPBPTYP;
  String? U_TRPAPPST;
  String? U_TRPCRBY;
  String? U_TRPADBS;
  List<bPAddresses_supplier>? BPAddresses;
  List<contactEmployees_supplier>? ContactEmployees;

  BP_PostModel_Supplier(
      {this.Series,
      this.CardName,
      this.CardType,
      this.CardForeignName,
      this.GroupCode,
      this.Currency,
      this.FederalTaxID,
      this.SalesPersonCode,
      this.Phone1,
      this.Cellular,
      this.EmailAddress,
      this.Website,
      this.U_ARADDR,
      this.U_TRPBPTYP,
      this.U_TRPAPPST,
      this.U_TRPCRBY,
      this.U_TRPADBS,
      this.BPAddresses,
      this.ContactEmployees});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Series': Series,
      'CardName': CardName,
      'CardType': CardType,
      'CardForeignName': CardForeignName,
      'GroupCode': GroupCode,
      'Currency': Currency,
      'FederalTaxID': FederalTaxID,
      'SalesPersonCode': SalesPersonCode,
      'Phone1': Phone1,
      'Cellular': Cellular,
      'EmailAddress': EmailAddress,
      'Website': Website,
      'U_ARADDR': U_ARADDR,
      'U_TRPBPTYP': U_TRPBPTYP,
      'U_TRPAPPST': U_TRPAPPST,
      'U_TRPCRBY': U_TRPCRBY,
      'U_TRPADBS': U_TRPADBS,
      'BPAddresses': BPAddresses?.map((x) => x.toMap()).toList(),
      'ContactEmployees': ContactEmployees?.map((x) => x.toMap()).toList(),
    };
  }

  factory BP_PostModel_Supplier.fromMap(Map<String, dynamic> map) {
    return BP_PostModel_Supplier(
      Series: map['Series'] != null ? map['Series'] as double : null,
      CardName: map['CardName'] != null ? map['CardName'] as String : null,
      CardType: map['CardType'] != null ? map['CardType'] as String : null,
      CardForeignName: map['CardForeignName'] != null
          ? map['CardForeignName'] as String
          : null,
      GroupCode: map['GroupCode'] != null ? map['GroupCode'] as double : null,
      Currency: map['Currency'] != null ? map['Currency'] as String : null,
      FederalTaxID:
          map['FederalTaxID'] != null ? map['FederalTaxID'] as String : null,
      SalesPersonCode: map['SalesPersonCode'] != null
          ? map['SalesPersonCode'] as String
          : null,
      Phone1: map['Phone1'] != null ? map['Phone1'] as String : null,
      Cellular: map['Cellular'] != null ? map['Cellular'] as String : null,
      EmailAddress:
          map['EmailAddress'] != null ? map['EmailAddress'] as String : null,
      Website: map['Website'] != null ? map['Website'] as String : null,
      U_ARADDR: map['U_ARADDR'] != null ? map['U_ARADDR'] as String : null,
      U_TRPBPTYP:
          map['U_TRPBPTYP'] != null ? map['U_TRPBPTYP'] as String : null,
      U_TRPAPPST:
          map['U_TRPAPPST'] != null ? map['U_TRPAPPST'] as String : null,
      U_TRPCRBY: map['U_TRPCRBY'] != null ? map['U_TRPCRBY'] as String : null,
      U_TRPADBS: map['U_TRPADBS'] != null ? map['U_TRPADBS'] as String : null,
      BPAddresses: map['BPAddresses'] != null
          ? List<bPAddresses_supplier>.from(
              (map['BPAddresses'] as List<int>).map<bPAddresses_supplier?>(
                (x) => bPAddresses_supplier.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      ContactEmployees: map['ContactEmployees'] != null
          ? List<contactEmployees_supplier>.from(
              (map['ContactEmployees'] as List<int>)
                  .map<contactEmployees_supplier?>(
                (x) => contactEmployees_supplier
                    .fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory BP_PostModel_Supplier.fromJson(String source) =>
      BP_PostModel_Supplier.fromMap(
          json.decode(source) as Map<String, dynamic>);
}

class bPAddresses_supplier {
  String? AddressName;
  String? AddressType;
  String? AddressName2;
  String? AddressName3;
  String? BuildingFloorRoom;
  String? Street;
  String? Block;
  String? ZipCode;
  String? City;
  String? Country;
  String? State;
  String? U_SCCode;

  bPAddresses_supplier(
      {this.AddressName,
      this.AddressType,
      this.AddressName2,
      this.AddressName3,
      this.BuildingFloorRoom,
      this.Street,
      this.Block,
      this.ZipCode,
      this.City,
      this.Country,
      this.State,
      this.U_SCCode});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'AddressName': AddressName,
      'AddressType': AddressType,
      'AddressName2': AddressName2,
      'AddressName3': AddressName3,
      'BuildingFloorRoom': BuildingFloorRoom,
      'Street': Street,
      'Block': Block,
      'ZipCode': ZipCode,
      'City': City,
      'Country': Country,
      'State': State,
      'U_SCCode': U_SCCode,
    };
  }

  factory bPAddresses_supplier.fromMap(Map<String, dynamic> map) {
    return bPAddresses_supplier(
      AddressName:
          map['AddressName'] != null ? map['AddressName'] as String : null,
      AddressType:
          map['AddressType'] != null ? map['AddressType'] as String : null,
      AddressName2:
          map['AddressName2'] != null ? map['AddressName2'] as String : null,
      AddressName3:
          map['AddressName3'] != null ? map['AddressName3'] as String : null,
      BuildingFloorRoom: map['BuildingFloorRoom'] != null
          ? map['BuildingFloorRoom'] as String
          : null,
      Street: map['Street'] != null ? map['Street'] as String : null,
      Block: map['Block'] != null ? map['Block'] as String : null,
      ZipCode: map['ZipCode'] != null ? map['ZipCode'] as String : null,
      City: map['City'] != null ? map['City'] as String : null,
      Country: map['Country'] != null ? map['Country'] as String : null,
      State: map['State'] != null ? map['State'] as String : null,
      U_SCCode: map['U_SCCode'] != null ? map['U_SCCode'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory bPAddresses_supplier.fromJson(String source) =>
      bPAddresses_supplier.fromMap(json.decode(source) as Map<String, dynamic>);
}

class contactEmployees_supplier {
  String? CardCode;
  String? Title;
  String? FirstName;
  String? MiddleName;
  String? LastName;
  String? Name;
  String? Position;
  String? Address;
  String? Phone1;
  String? Phone2;
  String? MobilePhone;
  String? E_Mail;
  String? DateOfBirth;
  String? Active;

  contactEmployees_supplier(
      {this.CardCode,
      this.Title,
      this.FirstName,
      this.MiddleName,
      this.LastName,
      this.Name,
      this.Position,
      this.Address,
      this.Phone1,
      this.Phone2,
      this.MobilePhone,
      this.E_Mail,
      this.DateOfBirth,
      this.Active});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'CardCode': CardCode,
      'Title': Title,
      'FirstName': FirstName,
      'MiddleName': MiddleName,
      'LastName': LastName,
      'Name': Name,
      'Position': Position,
      'Address': Address,
      'Phone1': Phone1,
      'Phone2': Phone2,
      'MobilePhone': MobilePhone,
      'E_Mail': E_Mail,
      'DateOfBirth': DateOfBirth,
      'Active': Active,
    };
  }

  factory contactEmployees_supplier.fromMap(Map<String, dynamic> map) {
    return contactEmployees_supplier(
      CardCode: map['CardCode'] != null ? map['CardCode'] as String : null,
      Title: map['Title'] != null ? map['Title'] as String : null,
      FirstName: map['FirstName'] != null ? map['FirstName'] as String : null,
      MiddleName:
          map['MiddleName'] != null ? map['MiddleName'] as String : null,
      LastName: map['LastName'] != null ? map['LastName'] as String : null,
      Name: map['Name'] != null ? map['Name'] as String : null,
      Position: map['Position'] != null ? map['Position'] as String : null,
      Address: map['Address'] != null ? map['Address'] as String : null,
      Phone1: map['Phone1'] != null ? map['Phone1'] as String : null,
      Phone2: map['Phone2'] != null ? map['Phone2'] as String : null,
      MobilePhone:
          map['MobilePhone'] != null ? map['MobilePhone'] as String : null,
      E_Mail: map['E_Mail'] != null ? map['E_Mail'] as String : null,
      DateOfBirth:
          map['DateOfBirth'] != null ? map['DateOfBirth'] as String : null,
      Active: map['Active'] != null ? map['Active'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory contactEmployees_supplier.fromJson(String source) =>
      contactEmployees_supplier
          .fromMap(json.decode(source) as Map<String, dynamic>);
}

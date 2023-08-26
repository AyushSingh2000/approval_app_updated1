// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_bp_details_modal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetBPDetailsModal _$GetBPDetailsModalFromJson(Map<String, dynamic> json) =>
    GetBPDetailsModal(
      cardDetails: (json['cardDetails'] as List<dynamic>)
          .map((e) => CardDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetBPDetailsModalToJson(GetBPDetailsModal instance) =>
    <String, dynamic>{
      'cardDetails': instance.cardDetails,
    };

CardDetail _$CardDetailFromJson(Map<String, dynamic> json) => CardDetail(
      CardCode: json['CardCode'] as String?,
      CardName: json['CardName'] as String?,
      CardType: json['CardType'] as String?,
      CardTypNm: json['CardTypNm'] as String?,
      IntrntSite: json['IntrntSite'] as String?,
      GroupCode: json['GroupCode'] as int?,
      Phone1: json['Phone1'] as String?,
      Phone2: json['Phone2'] as String?,
      Cellular: json['Cellular'] as String?,
      E_Mail: json['E_Mail'] as String?,
      Currency: json['Currency'] as String?,
      Balance: json['Balance'] as String?,
      ChecksBal: json['ChecksBal'] as String?,
      DNotesBal: json['DNotesBal'] as String?,
      OrdersBal: json['OrdersBal'] as String?,
      CreditLine: json['CreditLine'] as String?,
      DebtLine: json['DebtLine'] as String?,
      ListNum: json['ListNum'] as int?,
      PriceList: json['PriceList'] as String?,
      SlpCode: json['SlpCode'] as int?,
      SalEmpNam: json['SalEmpNam'] as String?,
      GroupNum: json['GroupNum'] as int?,
      PymntGroup: json['PymntGroup'] as String?,
      DebPayAcct: json['DebPayAcct'] as String?,
      DebPayNam: json['DebPayNam'] as String?,
      validFor: json['validFor'] as String?,
      frozenFor: json['frozenFor'] as String?,
      CreateDate: json['CreateDate'] as String?,
      CreateTS: json['CreateTS'] as int?,
      UpdateDate: json['UpdateDate'] as String?,
      UpdateTS: json['UpdateTS'] as int?,
      ContactPersons: (json['ContactPersons'] as List<dynamic>?)
          ?.map((e) => ContactPerson.fromJson(e as Map<String, dynamic>))
          .toList(),
      CustomerAddress: (json['CustomerAddress'] as List<dynamic>?)
          ?.map((e) => CustomerAdd.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CardDetailToJson(CardDetail instance) =>
    <String, dynamic>{
      'CardCode': instance.CardCode,
      'CardName': instance.CardName,
      'CardType': instance.CardType,
      'CardTypNm': instance.CardTypNm,
      'IntrntSite': instance.IntrntSite,
      'GroupCode': instance.GroupCode,
      'Phone1': instance.Phone1,
      'Phone2': instance.Phone2,
      'Cellular': instance.Cellular,
      'E_Mail': instance.E_Mail,
      'Currency': instance.Currency,
      'Balance': instance.Balance,
      'ChecksBal': instance.ChecksBal,
      'DNotesBal': instance.DNotesBal,
      'OrdersBal': instance.OrdersBal,
      'CreditLine': instance.CreditLine,
      'DebtLine': instance.DebtLine,
      'ListNum': instance.ListNum,
      'PriceList': instance.PriceList,
      'SlpCode': instance.SlpCode,
      'SalEmpNam': instance.SalEmpNam,
      'GroupNum': instance.GroupNum,
      'PymntGroup': instance.PymntGroup,
      'DebPayAcct': instance.DebPayAcct,
      'DebPayNam': instance.DebPayNam,
      'validFor': instance.validFor,
      'frozenFor': instance.frozenFor,
      'CreateDate': instance.CreateDate,
      'CreateTS': instance.CreateTS,
      'UpdateDate': instance.UpdateDate,
      'UpdateTS': instance.UpdateTS,
      'ContactPersons': instance.ContactPersons,
      'CustomerAddress': instance.CustomerAddress,
    };

ContactPerson _$ContactPersonFromJson(Map<String, dynamic> json) =>
    ContactPerson(
      CardCode: json['CardCode'] as String?,
      Name: json['Name'] as String?,
      FirstName: json['FirstName'] as String?,
      MiddleName: json['MiddleName'] as String?,
      LastName: json['LastName'] as String?,
      Tel1: json['Tel1'] as String?,
      Address: json['Address'] as String?,
      Designation: json['Designation'] as String?,
      Tel2: json['Tel2'] as String?,
      Cellolar: json['Cellolar'] as String?,
      E_MailL: json['E_MailL'] as String?,
      Active: json['Active'] as String?,
      CreateDate: json['CreateDate'] as String?,
      CreateTS: json['CreateTS'] as int?,
    );

Map<String, dynamic> _$ContactPersonToJson(ContactPerson instance) =>
    <String, dynamic>{
      'CardCode': instance.CardCode,
      'Name': instance.Name,
      'FirstName': instance.FirstName,
      'MiddleName': instance.MiddleName,
      'LastName': instance.LastName,
      'Tel1': instance.Tel1,
      'Address': instance.Address,
      'Designation': instance.Designation,
      'Tel2': instance.Tel2,
      'Cellolar': instance.Cellolar,
      'E_MailL': instance.E_MailL,
      'Active': instance.Active,
      'CreateDate': instance.CreateDate,
      'CreateTS': instance.CreateTS,
    };

CustomerAdd _$CustomerAddFromJson(Map<String, dynamic> json) => CustomerAdd(
      AdresType: json['AdresType'] as String?,
      AdresTypNm: json['AdresTypNm'] as String?,
      Address: json['Address'] as String?,
      CardCode: json['CardCode'] as String?,
      Building: json['Building'] as String?,
      Block: json['Block'] as String?,
      ZipCode: json['ZipCode'] as String?,
      City: json['City'] as String?,
      County: json['County'] as String?,
      Street: json['Street'] as String?,
      LandMark: json['LandMark'] as String?,
      Country: json['Country'] as String?,
      CountryNm: json['CountryNm'] as String?,
      State: json['State'] as String?,
      StateNm: json['StateNm'] as String?,
      GSTType: json['GSTType'] as String?,
      GSTRegnNo: json['GSTRegnNo'] as String?,
      CreateDate: json['CreateDate'] as String?,
      CreateTS: json['CreateTS'] as int?,
    );

Map<String, dynamic> _$CustomerAddToJson(CustomerAdd instance) =>
    <String, dynamic>{
      'AdresType': instance.AdresType,
      'AdresTypNm': instance.AdresTypNm,
      'Address': instance.Address,
      'CardCode': instance.CardCode,
      'Building': instance.Building,
      'Block': instance.Block,
      'ZipCode': instance.ZipCode,
      'City': instance.City,
      'County': instance.County,
      'Street': instance.Street,
      'LandMark': instance.LandMark,
      'Country': instance.Country,
      'CountryNm': instance.CountryNm,
      'State': instance.State,
      'StateNm': instance.StateNm,
      'GSTType': instance.GSTType,
      'GSTRegnNo': instance.GSTRegnNo,
      'CreateDate': instance.CreateDate,
      'CreateTS': instance.CreateTS,
    };

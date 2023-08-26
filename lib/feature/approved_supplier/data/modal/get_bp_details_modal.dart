import 'package:json_annotation/json_annotation.dart';


part 'get_bp_details_modal.g.dart';

@JsonSerializable()
class GetBPDetailsModal {
  final List<CardDetail> cardDetails;

  GetBPDetailsModal({required this.cardDetails});

  factory GetBPDetailsModal.fromJson(Map<String, dynamic> json) =>
      _$GetBPDetailsModalFromJson(json);

  Map<String, dynamic> toJson() => _$GetBPDetailsModalToJson(this);
}

@JsonSerializable()
class CardDetail {
  String? CardCode;
  String? CardName;
  String? CardType;
  String? CardTypNm;
  String? IntrntSite;
  int? GroupCode;
  String? Phone1;
  String? Phone2;
  String? Cellular;
  String? E_Mail;
  String? Currency;
  String? Balance;
  String? ChecksBal;
  String? DNotesBal;
  String? OrdersBal;
  String? CreditLine;
  String? DebtLine;
  int? ListNum;
  String? PriceList;
  int? SlpCode;
  String? SalEmpNam;
  int? GroupNum;
  String? PymntGroup;
  String? DebPayAcct;
  String? DebPayNam;
  String? validFor;
  String? frozenFor;
  String? CreateDate;
  int? CreateTS;
  String? UpdateDate;
  int? UpdateTS;
  List<ContactPerson>? ContactPersons;
  List<CustomerAdd>? CustomerAddress;

  CardDetail({
    this.CardCode,
    this.CardName,
    this.CardType,
    this.CardTypNm,
    this.IntrntSite,
    this.GroupCode,
    this.Phone1,
    this.Phone2,
    this.Cellular,
    this.E_Mail,
    this.Currency,
    this.Balance,
    this.ChecksBal,
    this.DNotesBal,
    this.OrdersBal,
    this.CreditLine,
    this.DebtLine,
    this.ListNum,
    this.PriceList,
    this.SlpCode,
    this.SalEmpNam,
    this.GroupNum,
    this.PymntGroup,
    this.DebPayAcct,
    this.DebPayNam,
    this.validFor,
    this.frozenFor,
    this.CreateDate,
    this.CreateTS,
    this.UpdateDate,
    this.UpdateTS,
    this.ContactPersons,
    this.CustomerAddress,
  });

  factory CardDetail.fromJson(Map<String, dynamic> json) =>
      _$CardDetailFromJson(json);

  Map<String, dynamic> toJson() => _$CardDetailToJson(this);
}

@JsonSerializable()
class ContactPerson {
  String? CardCode;
  String? Name;
  String? FirstName;
  String? MiddleName;
  String? LastName;
  String? Tel1;
  String? Address;
  String? Designation;
  String? Tel2;
  String? Cellolar;
  String? E_MailL;
  String? Active;
  String? CreateDate;
  int? CreateTS;

  ContactPerson({
    this.CardCode,
    this.Name,
    this.FirstName,
    this.MiddleName,
    this.LastName,
    this.Tel1,
    this.Address,
    this.Designation,
    this.Tel2,
    this.Cellolar,
    this.E_MailL,
    this.Active,
    this.CreateDate,
    this.CreateTS,
  });

  factory ContactPerson.fromJson(Map<String, dynamic> json) =>
      _$ContactPersonFromJson(json);

  Map<String, dynamic> toJson() => _$ContactPersonToJson(this);
}

@JsonSerializable()
class CustomerAdd {
  String? AdresType;
  String? AdresTypNm;
  String? Address;
  String? CardCode;
  String? Building;
  String? Block;
  String? ZipCode;
  String? City;
  String? County;
  String? Street;
  String? LandMark;
  String? Country;
  String? CountryNm;
  String? State;
  String? StateNm;
  String? GSTType;
  String? GSTRegnNo;
  String? CreateDate;
  int? CreateTS;

  CustomerAdd({
    this.AdresType,
    this.AdresTypNm,
    this.Address,
    this.CardCode,
    this.Building,
    this.Block,
    this.ZipCode,
    this.City,
    this.County,
    this.Street,
    this.LandMark,
    this.Country,
    this.CountryNm,
    this.State,
    this.StateNm,
    this.GSTType,
    this.GSTRegnNo,
    this.CreateDate,
    this.CreateTS,
  });

  factory CustomerAdd.fromJson(Map<String, dynamic> json) =>
      _$CustomerAddFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerAddToJson(this);
}

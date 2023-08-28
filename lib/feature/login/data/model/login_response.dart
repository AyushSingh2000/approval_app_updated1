class LoginResponseModel {
  String? status;
  String? message;
  String? data;
  String? Vendor;
  String? Customer;
  String? ItemMaster;
  String? Document;
  List<CompanyList>? companyList;

  LoginResponseModel(
      {this.status,
      this.message,
      this.data,
      this.Vendor,
      this.Customer,
      this.ItemMaster,
      this.Document,
      this.companyList});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'];
    Vendor = json['Vendor'];
    Customer = json['Customer'];
    ItemMaster = json['ItemMaster'];
    Document = json['Document'];
    if (json['CompanyList'] != null) {
      companyList = <CompanyList>[];
      json['CompanyList'].forEach((v) {
        companyList!.add(new CompanyList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['data'] = this.data;
    data['Vendor'] = this.Vendor;
    data['Customer'] = this.Customer;
    data['ItemMaster'] = this.ItemMaster;
    data['Document'] = this.Document;
    if (this.companyList != null) {
      data['CompanyList'] = this.companyList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CompanyList {
  String? databaseList;

  CompanyList({this.databaseList});

  CompanyList.fromJson(Map<String, dynamic> json) {
    databaseList = json['DatabaseList'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['DatabaseList'] = this.databaseList;
    return data;
  }
}

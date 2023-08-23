class LoginResponseModel {
  String? status;
  String? message;
  String? data;
  String? vendor;
  String? customer;
  String? itemMaster;
  String? document;
  List<CompanyList>? companyList;

  LoginResponseModel(
      {this.status,
      this.message,
      this.data,
      this.vendor,
      this.customer,
      this.itemMaster,
      this.document,
      this.companyList});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'];
    vendor = json['Vendor'];
    customer = json['Customer'];
    itemMaster = json['ItemMaster'];
    document = json['Document'];
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
    data['Vendor'] = this.vendor;
    data['Customer'] = this.customer;
    data['ItemMaster'] = this.itemMaster;
    data['Document'] = this.document;
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

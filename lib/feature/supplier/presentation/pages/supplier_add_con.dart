import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:new_app/ui/Buttons/buttonBS.dart';
import 'package:new_app/ui/TextField/customTextField.dart';

import '../../controller/supplier_controller.dart';
import '../../data/model/BP_post_1.dart';

class SupplierPage_2_1 extends StatefulWidget {
  const SupplierPage_2_1({super.key});

  @override
  State<SupplierPage_2_1> createState() => _SupplierPage_2_1State();
}

class _SupplierPage_2_1State extends State<SupplierPage_2_1> {
  SupplierController custCtrl = SupplierController();
  final SupplierController cust_Ctrl = Get.find<SupplierController>();
  var con_Title = ''.obs;
  var con_First_Name = ''.obs;
  var con_Middle_Name = ''.obs;
  var con_Last_Name = ''.obs;
  var con_Contact_Name = ''.obs;
  var con_Designation = ''.obs;
  var con_Telephone = ''.obs;
  var con_Mobile_No = ''.obs;
  var con_Email_Id = ''.obs;
  var con_Date_of_Birth = ''.obs;
  var con_Date_of_Anniversary = ''.obs;
  var con_Address = ''.obs;
  var con_Active = ''.obs;

  void addcontact() {
    contactEmployees_supplier newcontact = contactEmployees_supplier(
        Title: con_Title.value,
        FirstName: con_First_Name.value,
        MiddleName: con_Middle_Name.value,
        LastName: con_Last_Name.value,
        Name: con_Contact_Name.value,
        Position: con_Designation.value,
        Address: con_Address.value,
        Phone1: con_Telephone.value,
        MobilePhone: con_Mobile_No.value,
        E_Mail: con_Email_Id.value,
        DateOfBirth: con_Date_of_Birth.value,
        Active: con_Active.value);

    cust_Ctrl.contactemployee.add(newcontact);
  }
  // void addcontact() {
  //   contactEmployees newcontact = contactEmployees(
  //       CardCode: "CAE00283",
  //       Title: null,
  //       FirstName: "ARYAAN THADANI",
  //       MiddleName: null,
  //       LastName: null,
  //       Name: "ARYAAN THADANI",
  //       Position: "PROCURMENT OFFICER",
  //       Address: null,
  //       Phone1: "+971586536028",
  //       MobilePhone: "+971528937975",
  //       E_Mail: null,
  //       DateOfBirth: null,
  //       Active: "tYES");
  //
  //   cust_Ctrl.contactemployee.add(newcontact);
  // }

  List<String> list3 = ['yes', 'no'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          ' Add Contact',
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                hintText: 'Title',
                onChanged: (p0) => con_Title.value = p0,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                hintText: 'First Name *',
                onChanged: (p0) => con_First_Name.value = p0,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                hintText: 'Middle Name',
                onChanged: (p0) => con_Middle_Name.value = p0,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                hintText: 'Last Name',
                onChanged: (p0) => con_Last_Name.value = p0,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                hintText: 'Contact Name *',
                onChanged: (p0) => con_Contact_Name.value = p0,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                hintText: 'Position *',
                onChanged: (p0) => con_Designation.value = p0,
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 3),
                child: IntlPhoneField(
                  onCountryChanged: (val) {
                    // cc.dial_code.value = val.dialCode;
                  },
                  flagsButtonPadding: const EdgeInsets.all(8),
                  dropdownIconPosition: IconPosition.trailing,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(0),
                    hintText: 'Telephone No.',
                    hintStyle: TextStyle(fontWeight: FontWeight.normal),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide(),
                    ),
                  ),
                  initialCountryCode: 'IN',
                  onChanged: (phone) {
                    con_Telephone.value = phone.completeNumber;
                  },
                ),
              ),

              // const SizedBox(height: 5.0),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 3),
                child: IntlPhoneField(
                  onCountryChanged: (val) {
                    // cc.dial_code.value = val.dialCode;
                  },
                  flagsButtonPadding: const EdgeInsets.all(8),
                  dropdownIconPosition: IconPosition.trailing,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(0),
                    hintText: 'Phone Number',
                    hintStyle: TextStyle(fontWeight: FontWeight.normal),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide(),
                    ),
                  ),
                  initialCountryCode: 'IN',
                  onChanged: (phone) {
                    con_Mobile_No.value = phone.completeNumber;
                  },
                ),
              ),
              CustomTextField(
                hintText: 'Email ID',
                onChanged: (p0) => con_Email_Id.value = p0,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                hintText: 'Date of Birth',
                onChanged: (p0) => con_Date_of_Birth.value = p0,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                hintText: 'Date of Anniversary',
                onChanged: (p0) => con_Date_of_Anniversary.value = p0,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                hintText: 'Address',
                onChanged: (p0) => con_Address.value = p0,
              ),
              const SizedBox(
                height: 10,
              ),
              // DropdownButtonFormField<String>(
              //   hint: Text(
              //     'Select items',
              //     style: TextStyle(color: Colors.black),
              //   ),
              //   decoration: InputDecoration(
              //     filled: true, //<-- SEE HERE
              //     fillColor: const Color.fromARGB(255, 225, 225, 225),
              //     labelText: 'Active *',
              //     border: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(12)),
              //   ),
              //   onChanged: (newValue) {
              //     con_Active.value = newValue!;
              //   },
              //   items: list3.map((String value) {
              //     return DropdownMenuItem<String>(
              //       value: value,
              //       child: Text(value),
              //     );
              //   }).toList(),
              // ),
              // const SizedBox(
              //   height: 10,
              // ),
              const Text(
                '* fields are required',
                style: TextStyle(color: Colors.blue),
              ),
              const SizedBox(
                height: 10,
              ),
              ButtonBS(
                onPressed: () {
                  if (con_First_Name.value != '' &&
                      con_Contact_Name.value != '' &&
                      con_Designation.value != '' &&
                      con_Mobile_No.value != '') {
                    addcontact();

                    Get.back();
                  } else {
                    const snackBar = SnackBar(
                      content: Text(
                        'Fill all required field',
                        style: TextStyle(color: Colors.blue, fontSize: 16),
                      ),
                      duration: Duration(milliseconds: 1000),
                      backgroundColor: Color.fromARGB(255, 220, 220, 220),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
                title: 'Add',
                backgroundColor: Colors.blue,
                width: 100,
                height: 40,
                textColor: Colors.white,
                borderRadius: 12,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

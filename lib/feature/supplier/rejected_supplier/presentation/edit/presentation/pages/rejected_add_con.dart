import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:new_app/ui/Buttons/buttonBS.dart';
import 'package:new_app/ui/TextField/customTextField.dart';
import 'package:new_app/ui/colors/app_colors.dart';

import '../../controller/edit_rejected_controller.dart';
import '../../data/model/rejected_model.dart';

class CustomerPage_2_1 extends StatefulWidget {
  const CustomerPage_2_1({super.key});

  @override
  State<CustomerPage_2_1> createState() => _CustomerPage_2_1State();
}

class _CustomerPage_2_1State extends State<CustomerPage_2_1> {
  EditRejectedController_Supplier custCtrl = EditRejectedController_Supplier();
  final EditRejectedController_Supplier cust_Ctrl =
      Get.find<EditRejectedController_Supplier>();
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

  var full = ''.obs;

  void addcontact() {
    contactEmployees newcontact = contactEmployees(
        Title: con_Title.value,
        FirstName: con_First_Name.value,
        MiddleName: con_Middle_Name.value,
        LastName: con_Last_Name.value,
        Name: con_Middle_Name.value.isEmpty
            ? con_First_Name.value +
                '' +
                con_Middle_Name.value +
                ' ' +
                con_Last_Name.value
            : con_First_Name.value +
                ' ' +
                con_Middle_Name.value +
                ' ' +
                con_Last_Name.value,
        Position: con_Designation.value,
        Address: con_Address.value,
        Phone1: con_Telephone.value,
        MobilePhone: con_Mobile_No.value,
        E_Mail: con_Email_Id.value,
        DateOfBirth: con_Date_of_Birth.value,
        Active: 'Y');
    print(newcontact);
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
  TextEditingController dobController = TextEditingController();
  TextEditingController anniversaryController = TextEditingController();
  Rx<DateTime?> selectedDate = Rx<DateTime?>(null);
  Rx<DateTime?> anniDate = Rx<DateTime?>(null);

  String formatDate(DateTime? date, {bool isFormatted = true}) {
    if (date == null) return '';

    if (isFormatted) {
      return '${date.day.toString().padLeft(2, '0')}-${date.month.toString().padLeft(2, '0')}-${date.year.toString()}';
    } else {
      return '${date.year.toString()}${date.month.toString().padLeft(2, '0')}${date.day.toString().padLeft(2, '0')}';
    }
  }

  List<String> list3 = ['tYES', 'tNO'];
  List<String> title = ['Mr', 'Mrs'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appbarmainblue,
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

              Container(
                margin: const EdgeInsets.symmetric(vertical: 0),
                height: 60,
                child: TextDropdownFormField(
                  decoration: InputDecoration(
                    // enabled: false,
                    labelText: 'Select Title',
                    fillColor: Colors.grey[200],
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black.withOpacity(0.6),
                      ),
                    ),

                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(9)),
                    // hintText: 'Select State',
                    filled: true,
                    hintStyle: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                    contentPadding:
                        const EdgeInsets.only(left: 12, right: 12, top: 20),
                    isCollapsed: true,
                  ),
                  options: title,
                  onChanged: (dynamic newValue) {
                    con_Title.value = newValue;
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                  hintText: 'First Name *',
                  onChanged: (p0) {
                    con_First_Name.value = p0;
                  }),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                  hintText: 'Middle Name',
                  onChanged: (p0) {
                    con_Middle_Name.value = p0;
                  }),
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
              Obx(
                () => CustomTextField(
                    hintText: (con_First_Name.value +
                                con_Middle_Name.value +
                                con_Last_Name.value)
                            .isEmpty
                        ? "Contact Name"
                        : con_Middle_Name.value.isEmpty
                            ? con_First_Name.value +
                                '' +
                                con_Middle_Name.value +
                                ' ' +
                                con_Last_Name.value
                            : con_First_Name.value +
                                ' ' +
                                con_Middle_Name.value +
                                ' ' +
                                con_Last_Name.value,
                    enable: false,
                    onChanged: (p0) {}),
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
              TextField(
                controller: dobController,
                decoration: InputDecoration(
                  hintText: 'Date of Birth',
                  prefixIcon: Icon(Icons.calendar_today),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 1.0),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                readOnly: true, // Make the text field non-editable
                onTap: () async {
                  final currentDate = selectedDate.value ?? DateTime.now();
                  final pickedDate = await showDatePicker(
                    context: context,
                    initialDate: currentDate,
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );

                  if (pickedDate != null && pickedDate != selectedDate.value) {
                    selectedDate.value = pickedDate;
                    dobController.text = formatDate(pickedDate);
                    con_Date_of_Birth.value =
                        formatDate(pickedDate, isFormatted: false);
                  }
                  print('!!!!!!!${con_Date_of_Birth.value}');
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: anniversaryController,
                decoration: InputDecoration(
                  hintText: 'Date of Anniversary',
                  prefixIcon: Icon(Icons.calendar_today),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 1.0),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                readOnly: true, // Make the text field non-editable
                onTap: () async {
                  final currentDate = anniDate.value ?? DateTime.now();
                  final pickedDate = await showDatePicker(
                    context: context,
                    initialDate: currentDate,
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );

                  if (pickedDate != null && pickedDate != anniDate.value) {
                    anniDate.value = pickedDate;
                    anniversaryController.text = formatDate(pickedDate);
                    con_Date_of_Anniversary.value =
                        formatDate(pickedDate, isFormatted: false);
                  }
                  print('!!!!!!!${con_Date_of_Anniversary.value}');
                },
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
              const SizedBox(
                height: 10,
              ),
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
                title: Text('Add'),
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

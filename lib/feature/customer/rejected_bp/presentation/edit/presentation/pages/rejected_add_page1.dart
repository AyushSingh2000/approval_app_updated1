import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:new_app/feature/customer/createCustomer/controller/customer_controller.dart';
import 'package:new_app/feature/customer/rejected_bp/controller/rejected_bp_controller.dart';
// import 'package:new_app/feature/customer/presentation/pages/rejected_add_page2.dart';
import 'package:new_app/ui/Buttons/buttonBS.dart';
import 'package:new_app/ui/colors/app_colors.dart';

import '../../../../../../../ui/TextField/customTextField.dart';
import '../../controller/edit_rejected_controller.dart';
import 'rejected_add_page2.dart';

class EditRejectedCustomerPage extends StatefulWidget {
  EditRejectedCustomerPage({super.key});

  @override
  State<EditRejectedCustomerPage> createState() => _EditRejectedCustomerPageState();
}

class _EditRejectedCustomerPageState extends State<EditRejectedCustomerPage> {
  EditRejectedController customerController = Get.put(EditRejectedController());
  RejectedCustomerController rc = Get.put(RejectedCustomerController());

  List<String> list1 = ['customer', 'vendor'];
  Map<String, String> list1_1 = {
    'customer': 'cCustomer',
    'vendor': 'cSupplier'
  };
  List<String> list2 = ['Approved', 'Un-Approved', 'Rejected	', 'On-Hold'];
  List<String> list3 = ['yes', 'no'];
  Map<String, String> list3_1 = {'yes': 'tYES', 'no': 'tNO'};

  TextEditingController seriesController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController foreignController = TextEditingController();
  TextEditingController groupController = TextEditingController();
  TextEditingController taxIdController = TextEditingController();
  TextEditingController telephoneController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController websiteController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  void initState() {
    if(rc.GetBPDetailsList[0].CardName != null){
      nameController.text = rc.GetBPDetailsList[0].CardName!;
    }


    if(rc.GetBPDetailsList[0].Phone1 != null){
      telephoneController.text = rc.GetBPDetailsList[0].Phone1!;
    }
    if(rc.GetBPDetailsList[0].Phone2 != null){
      numberController.text = rc.GetBPDetailsList[0].Phone2!;
    }
    if(rc.GetBPDetailsList[0].E_Mail != null){
      emailController.text = rc.GetBPDetailsList[0].E_Mail!;
    }
    if(rc.GetBPDetailsList[0].IntrntSite != null){
      websiteController.text = rc.GetBPDetailsList[0].IntrntSite!;
    }
    if(rc.GetBPDetailsList[0].IntrntSite != null){
      websiteController.text = rc.GetBPDetailsList[0].IntrntSite!;
    }

    if(rc.GetBPDetailsList[0].GroupCode!=null){
      print(customerController.BPGroupCodeList.value);
      customerController.BPGroupCodeMapData.value.forEach((key, value) {
        if(value==rc.GetBPDetailsList[0].GroupCode){
          customerController.Group.value = key;
          customerController.Group.refresh();
        }
      });
    }

    if(rc.GetBPDetailsList[0].Currency != null){
      customerController.Currencies.value = rc.GetBPDetailsList[0].Currency!;
    }

    print(rc.GetBPDetailsList[0].SalEmpNam);
    print(customerController.BPSaleEmployeesList.value);
    if(rc.GetBPDetailsList[0].SalEmpNam != null){
      customerController.SaleEmployees.value = rc.GetBPDetailsList[0].SalEmpNam!;
      if(customerController.BPSaleEmployeesList.value.contains(rc.GetBPDetailsList[0].SalEmpNam!)==false){
        customerController.BPSaleEmployeesList.value.add(rc.GetBPDetailsList[0].SalEmpNam!);
      }
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appbarmainblue,
        title: const Text(
          'Edit',
        ),
        elevation: 0,
        // backgroundColor: AppColors.statusColorPol,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Obx(() {
            if (customerController.initialDataLoading.value) {
              return const Center(
                child: LinearProgressIndicator(),
              );
            }

            return Column(
              children: [
                // Container(
                //   margin: const EdgeInsets.symmetric(vertical: 0),
                //   height: 60,
                //   child: TextDropdownFormField(
                //     decoration: InputDecoration(
                //       // enabled: false,
                //       labelText: customerController.BPSeriesList.isEmpty
                //           ? 'No Series Found'
                //           : 'Select Series',
                //       fillColor: Colors.grey[200],
                //       suffixIcon: Padding(
                //         padding: const EdgeInsets.all(18.0),
                //         child: Icon(
                //           Icons.arrow_drop_down,
                //           color: Colors.black.withOpacity(0.6),
                //         ),
                //       ),
                //
                //       border: OutlineInputBorder(
                //           borderSide: BorderSide.none,
                //           borderRadius: BorderRadius.circular(9)),
                //       // hintText: 'Select State',
                //       filled: true,
                //       hintStyle: const TextStyle(
                //           fontWeight: FontWeight.bold, color: Colors.black),
                //       contentPadding:
                //           const EdgeInsets.only(left: 12, right: 12, top: 20),
                //       isCollapsed: true,
                //     ),
                //     options: customerController.BPSeriesList,
                //     onChanged: (dynamic newValue) {
                //       customerController.Series.value = customerController
                //           .BPSeriesMapData[newValue!]
                //           .toString();
                //       print(customerController.Series.value);
                //     },
                //   ),
                // ),

                // const SizedBox(height: 16.0),

                CustomTextField(
                  hintText: "Name",
                  controller: nameController,
                  onChanged: (p0) => customerController.Name.value = p0,
                ), //name
                const SizedBox(height: 16.0),

                CustomTextField(
                  controller: foreignController,
                  hintText: 'Foreign Name',
                  onChanged: (p0) => customerController.Foreign_name.value = p0,
                ), //foreign name
                const SizedBox(height: 25.0),

                Container(
                  margin: const EdgeInsets.symmetric(vertical: 0),
                  height: 60,
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: 'Select Group',
                      fillColor: Colors.grey[200],
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(9),
                      ),
                      contentPadding: EdgeInsets.only(left: 12, right: 12, top: 20),
                    ),
                    value: customerController.Group.value, // You can set the initial value here
                    onChanged: (newValue) {
                      setState(() {
                        customerController.Group.value = newValue!;
                      });
                    },
                    items: customerController.BPGroupCodeList.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),

                ), //group

                const SizedBox(height: 16.0),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 0),
                  height: 60,
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: 'Select Currency',
                      fillColor: Colors.grey[200],
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(9),
                      ),
                      contentPadding: EdgeInsets.only(left: 12, right: 12, top: 20),
                    ),
                    value: customerController.Currencies.value, // You can set the initial value here
                    onChanged: (newValue) {
                      setState(() {
                        customerController.Currencies.value = newValue!;
                      });
                    },
                    items: customerController.BPCurrenciesList.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                // Container(
                //   margin: const EdgeInsets.symmetric(vertical: 0),
                //   height: 60,
                //   child: TextDropdownFormField(
                //     decoration: InputDecoration(
                //       // enabled: false,
                //       // labelText: rc.GetBPDetailsList[0].Currency != ''
                //       //     ? customerController.BPCurrenciesMapData.keys
                //       //         .firstWhere(
                //       //             (k) =>
                //       //                 customerController
                //       //                     .BPCurrenciesMapData[k] ==
                //       //                 rc.GetBPDetailsList[0].Currency,
                //       //             orElse: () =>
                //       //                 customerController.BPCurrenciesList[0])
                //       //     : 'Select currency',
                //       // labelText: customerController.BPCurrenciesList.isEmpty
                //       //     ? 'No Currency Found'
                //       //     : customerController.BPCurrenciesList[0],
                //       labelText: "Currency",
                //       fillColor: Colors.grey[200],
                //       suffixIcon: Padding(
                //         padding: const EdgeInsets.all(18.0),
                //         child: Icon(
                //           Icons.arrow_drop_down,
                //           color: Colors.black.withOpacity(0.6),
                //         ),
                //       ),
                //
                //       border: OutlineInputBorder(
                //           borderSide: BorderSide.none,
                //           borderRadius: BorderRadius.circular(9)),
                //       filled: true,
                //       hintStyle: const TextStyle(
                //           fontWeight: FontWeight.bold, color: Colors.black),
                //       contentPadding:
                //           const EdgeInsets.only(left: 12, right: 12, top: 20),
                //       isCollapsed: true,
                //     ),
                //     options: customerController.BPCurrenciesList,
                //     onChanged: (dynamic newValue) {
                //       customerController.Currencies.value =
                //           customerController.BPCurrenciesMapData[newValue];
                //     },
                //   ),
                // ),


                // const SizedBox(height: 16.0),
                //
                // CustomTextField(
                //   hintText: 'Federal Tax id',
                //   onChanged: (p0) =>
                //       customerController.Federal_tax_id.value = p0,
                // ), //federal tax id
                const SizedBox(height: 16.0),

                Container(
                  margin: const EdgeInsets.symmetric(vertical: 0),
                  height: 60,
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: 'Select Employee',
                      fillColor: Colors.grey[200],
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(9),
                      ),
                      contentPadding: EdgeInsets.only(left: 12, right: 12, top: 20),
                    ),
                    value: customerController.SaleEmployees.value, // You can set the initial value here
                    onChanged: (newValue) {
                      setState(() {
                        customerController.SaleEmployees.value = newValue!;
                      });
                    },
                    items: customerController.BPSaleEmployeesList.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),

                ),
                const SizedBox(height: 16.0),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3),
                  child: IntlPhoneField(
                    controller: telephoneController,
                    onCountryChanged: (val) {
                      // cc.dial_code.value = val.dialCode;
                    },
                    flagsButtonPadding: const EdgeInsets.all(8),
                    dropdownIconPosition: IconPosition.trailing,
                    decoration: InputDecoration(
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
                      customerController.Telephone.value = phone.completeNumber;
                    },
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3),
                  child: IntlPhoneField(
                    controller: numberController,
                    onCountryChanged: (val) {
                      // cc.dial_code.value = val.dialCode;
                    },
                    flagsButtonPadding: const EdgeInsets.all(8),
                    dropdownIconPosition: IconPosition.trailing,
                    decoration: InputDecoration(
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
                      customerController.Mobile.value = phone.completeNumber;
                    },
                  ),
                ),

                CustomTextField(
                  controller: emailController,
                  hintText: 'Email',
                  onChanged: (p0) => customerController.Email.value = p0,
                ), //mobile number
                const SizedBox(height: 16.0),

                CustomTextField(
                  controller: websiteController,
                  hintText: 'Website',
                  onChanged: (p0) => customerController.Website.value = p0,
                ), //mobile number

                // const SizedBox(height: 16.0),
                //
                // CustomTextField(
                //   controller: addressController,
                //   hintText: 'Address in arabic ',
                //   onChanged: (p0) =>
                //       customerController.Arabic_address.value = p0,
                // ), //mobile number
                const SizedBox(height: 16.0),

                const SizedBox(height: 16.0),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ButtonBS(
                      height: 40,
                      width: 100,
                      borderRadius: 12,
                      backgroundColor: AppColors.appbarmainblue,
                      title: Text(
                        'Next',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) =>
                                    const EditRejectedCustomerPage2()));
                        // Get.to(() => const CustomerPage_2());
                      },
                    )
                  ],
                )

                // Display contact list
              ],
            );
          }),
        ),
      ),
    );
  }
}

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
  final List list;
  EditRejectedCustomerPage({super.key, required this.list});

  @override
  State<EditRejectedCustomerPage> createState() =>
      _EditRejectedCustomerPageState();
}

class _EditRejectedCustomerPageState extends State<EditRejectedCustomerPage> {
  List<String> list1 = ['customer', 'vendor'];
  Map<String, String> list1_1 = {
    'customer': 'cCustomer',
    'vendor': 'cSupplier'
  };
  List<String> list2 = ['Approved', 'Un-Approved', 'Rejected	', 'On-Hold'];
  List<String> list3 = ['yes', 'no'];
  Map<String, String> list3_1 = {'yes': 'tYES', 'no': 'tNO'};

  // TextEditingController seriesController = new TextEditingController();
  // TextEditingController nameController = new TextEditingController();
  // TextEditingController foreignController = new TextEditingController();
  // TextEditingController groupController = new TextEditingController();
  // TextEditingController currencyController = new TextEditingController();
  // TextEditingController taxIdController = new TextEditingController();
  // TextEditingController employeeController = new TextEditingController();
  // TextEditingController telephoneController = new TextEditingController();
  // TextEditingController numberController = new TextEditingController();
  // TextEditingController emailController = new TextEditingController();
  // TextEditingController websiteController = new TextEditingController();
  // TextEditingController addressController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    EditRejectedController customerController =
        Get.put(EditRejectedController());
    CustomerController cc = Get.put(CustomerController());
    RejectedCustomerController rc = Get.put(RejectedCustomerController());

    // nameController.text = rc.GetBPDetailsList[0].CardName!;
    // currencyController.text = rc.GetBPDetailsList[0].Currency!;
    // employeeController.text = rc.GetBPDetailsList[0].SalEmpNam!;
    // telephoneController.text = rc.GetBPDetailsList[0].Phone1!;
    // numberController.text = rc.GetBPDetailsList[0].Phone2!;
    // emailController.text = rc.GetBPDetailsList[0].E_Mail!;
    // websiteController.text = rc.GetBPDetailsList[0].IntrntSite!;
    // websiteController.text = rc.GetBPDetailsList[0].IntrntSite!;

    print('from edit page 1:${rc.GetBPDetailsList[0].CardName}');
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
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 0),
                  height: 60,
                  child: TextDropdownFormField(
                    decoration: InputDecoration(
                      // enabled: false,
                      labelText: customerController.BPSeriesList.isEmpty
                          ? 'No Series Found'
                          : 'Select Series',
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
                    options: customerController.BPSeriesList,
                    onChanged: (dynamic newValue) {
                      customerController.Series.value = customerController
                          .BPSeriesMapData[newValue!]
                          .toString();
                      print(customerController.Series.value);
                    },
                  ),
                ),

                const SizedBox(height: 16.0),

                CustomTextField(
                  hintText: 'Name',
                  onChanged: (p0) => customerController.Name.value = p0,
                ), //name
                const SizedBox(height: 16.0),

                CustomTextField(
                  hintText: 'Foreign Name',
                  onChanged: (p0) => customerController.Foreign_name.value = p0,
                ), //foreign name
                const SizedBox(height: 16.0),

                Container(
                  margin: const EdgeInsets.symmetric(vertical: 0),
                  height: 60,
                  child: TextDropdownFormField(
                    decoration: InputDecoration(
                      // enabled: false,
                      labelText: customerController.BPGroupCodeList.isEmpty
                          ? 'No Group Found'
                          : 'Select Group',
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
                    options: customerController.BPGroupCodeList,
                    onChanged: (dynamic newValue) {
                      customerController.GroupCode.value =
                          customerController.BPGroupCodeMapData[newValue];
                    },
                  ),
                ), //group

                const SizedBox(height: 16.0),

                Container(
                  margin: const EdgeInsets.symmetric(vertical: 0),
                  height: 60,
                  child: TextDropdownFormField(
                    decoration: InputDecoration(
                      // enabled: false,
                      labelText: customerController.BPCurrenciesList.isEmpty
                          ? 'No Currency Found'
                          : customerController.BPCurrenciesList[0],
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
                    options: customerController.BPCurrenciesList,
                    onChanged: (dynamic newValue) {
                      customerController.Currencies.value =
                          customerController.BPCurrenciesMapData[newValue];
                    },
                  ),
                ),
                const SizedBox(height: 16.0),

                CustomTextField(
                  hintText: 'Federal Tax id',
                  onChanged: (p0) =>
                      customerController.Federal_tax_id.value = p0,
                ), //federal tax id
                const SizedBox(height: 16.0),

                Container(
                  margin: const EdgeInsets.symmetric(vertical: 0),
                  height: 60,
                  child: TextDropdownFormField(
                    decoration: InputDecoration(
                      // enabled: false,
                      labelText: customerController.BPSaleEmployeesList.isEmpty
                          ? 'No Employee Found'
                          : 'Select Employee',
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
                    options: customerController.BPSaleEmployeesList,
                    onChanged: (dynamic newValue) {
                      customerController.SaleEmployeesCode.value =
                          customerController.BPSaleEmployeesMapData[newValue];
                    },
                  ),
                ),
                const SizedBox(height: 16.0),

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
                      customerController.Telephone.value = phone.completeNumber;
                    },
                  ),
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
                  hintText: 'Email',
                  onChanged: (p0) => customerController.Email.value = p0,
                ), //mobile number
                const SizedBox(height: 16.0),

                CustomTextField(
                  hintText: 'Website',
                  onChanged: (p0) => customerController.Website.value = p0,
                ), //mobile number
                const SizedBox(height: 16.0),

                CustomTextField(
                  hintText: 'Address in arabic ',
                  onChanged: (p0) =>
                      customerController.Arabic_address.value = p0,
                ), //mobile number
                const SizedBox(height: 16.0),

                const SizedBox(height: 16.0),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ButtonBS(
                      height: 40,
                      width: 100,
                      borderRadius: 12,
                      backgroundColor: Colors.blue,
                      textColor: Colors.white,
                      title: Text('Next'),
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

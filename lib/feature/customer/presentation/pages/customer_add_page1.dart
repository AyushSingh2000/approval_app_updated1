import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:new_app/feature/customer/presentation/pages/customer_add_page2.dart';
import 'package:new_app/ui/Buttons/buttonBS.dart';

import '../../../../ui/TextField/customTextField.dart';
import '../../controller/customer_controller.dart';

class CustomerPage extends StatefulWidget {
  CustomerPage({super.key});

  @override
  State<CustomerPage> createState() => _CustomerPageState();
}

class _CustomerPageState extends State<CustomerPage> {
  CustomerController customerController = Get.put(CustomerController());

  List<String> list1 = ['customer', 'vendor'];
  Map<String, String> list1_1 = {
    'customer': 'cCustomer',
    'vendor': 'cSupplier'
  };
  List<String> list2 = ['Approved', 'Un-Approved', 'Rejected	', 'On-Hold'];
  List<String> list3 = ['yes', 'no'];
  Map<String, String> list3_1 = {'yes': 'tYES', 'no': 'tNO'};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Customer',
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
                child: CircularProgressIndicator(),
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

//series
//                 const SizedBox(height: 16.0),
//
//                 CustomTextField(
//                   hintText: customerController.BPSeriesMapData[
//                               customerController.Series.value] ==
//                           null
//                       ? 'Series Code'
//                       : customerController
//                           .BPSeriesMapData[customerController.Series.value]
//                           .toString(),
//                   keyboardType: TextInputType.none,
//                   enable: false,
//                   onChanged: (p0) => customerController.Code.value = p0,
//                 ), //code
                const SizedBox(height: 16.0),

                CustomTextField(
                  hintText: 'Name',
                  onChanged: (p0) => customerController.Name.value = p0,
                ), //name
                const SizedBox(height: 16.0),

                //cardtype
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 0),
                  height: 60,
                  child: TextDropdownFormField(
                    decoration: InputDecoration(
                      // enabled: false,
                      labelText: list1.isEmpty
                          ? 'No Card type Found'
                          : 'Select Card type',
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
                    options: list1,
                    onChanged: (dynamic newValue) {
                      customerController.Cardtype.value = list1_1[newValue]!;
                    },
                  ),
                ),
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

                // DropdownButtonFormField<String>(
                //   hint: const Text(
                //     'All Currencies',
                //     style: TextStyle(color: Colors.black),
                //   ),
                //   decoration: InputDecoration(
                //     filled: true, //<-- SEE HERE
                //     fillColor: const Color.fromARGB(255, 225, 225, 225),
                //     labelText: 'Currency',
                //     border: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(12)),
                //   ),
                //   onChanged: (newValue) {
                //     customerController.Currencies.value =
                //         customerController.BPCurrenciesMapData[newValue];
                //   },
                //   items:
                //       customerController.BPCurrenciesList.map((String value) {
                //     return DropdownMenuItem<String>(
                //       value: value,
                //       child: Text(value),
                //     );
                //   }).toList(),
                // ),

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

                // CustomTextField(
                //   hintText: 'Telephone',
                //   onChanged: (p0) => customerController.Telephone.value = p0,
                // ), //telephone

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
                      customerController.Mobile.value = phone.completeNumber;
                    },
                  ),
                ),

                // CustomTextField(
                //   hintText: 'Mobile no.',
                //   onChanged: (p0) => customerController.Mobile.value = p0,
                // ), //mobile number
                // const SizedBox(height: 16.0),

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

                // DropdownButtonFormField<String>(
                //   hint: Text(
                //     'Select Status',
                //     style: TextStyle(color: Colors.black),
                //   ),
                //   decoration: InputDecoration(
                //     filled: true, //<-- SEE HERE
                //     fillColor: const Color.fromARGB(255, 225, 225, 225),
                //     labelText: 'Status',
                //     border: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(12)),
                //   ),
                //   onChanged: (newValue) {
                //     customerController.Status.value = newValue!;
                //   },
                //   items: list2.map((String value) {
                //     return DropdownMenuItem<String>(
                //       value: value,
                //       child: Text(value),
                //     );
                //   }).toList(),
                // ), //status
                // const SizedBox(height: 16.0),
                //
                // DropdownButtonFormField<String>(
                //   hint: Text(
                //     'Select Active',
                //     style: TextStyle(color: Colors.black),
                //   ),
                //   decoration: InputDecoration(
                //     filled: true, //<-- SEE HERE
                //     fillColor: const Color.fromARGB(255, 225, 225, 225),
                //     labelText: 'Active',
                //     border: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(12)),
                //   ),
                //   onChanged: (newValue) {
                //     customerController.Active.value = list3_1[newValue]!;
                //   },
                //   items: list3.map((String value) {
                //     return DropdownMenuItem<String>(
                //       value: value,
                //       child: Text(value),
                //     );
                //   }).toList(),
                // ),
                // const SizedBox(height: 16.0),

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
                                builder: (context) => const CustomerPage_2()));
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

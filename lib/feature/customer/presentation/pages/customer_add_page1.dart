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
                DropdownButtonFormField<String>(
                  hint: Text(
                    'Select Series',
                    style: TextStyle(color: Colors.black),
                  ),
                  decoration: InputDecoration(
                    filled: true, //<-- SEE HERE
                    fillColor: const Color.fromARGB(255, 225, 225, 225),
                    labelText: 'Series',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  onChanged: (newValue) {
                    customerController.Series.value = customerController
                        .BPSeriesMapData[newValue!]
                        .toString();
                    print(customerController.Series.value);
                  },
                  items: customerController.BPSeriesList.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
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

                DropdownButtonFormField<String>(
                  hint: Text(
                    'Select Card Type',
                    style: TextStyle(color: Colors.black),
                  ),
                  decoration: InputDecoration(
                    filled: true, //<-- SEE HERE
                    fillColor: const Color.fromARGB(255, 225, 225, 225),
                    labelText: 'Card type',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  onChanged: (newValue) {
                    customerController.Cardtype.value = list1_1[newValue]!;
                  },
                  items: list1.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                //cardtype
                const SizedBox(height: 16.0),

                CustomTextField(
                  hintText: 'Foreign Name',
                  onChanged: (p0) => customerController.Foreign_name.value = p0,
                ), //foreign name
                const SizedBox(height: 16.0),

                DropdownButtonFormField<String>(
                  hint: const Text(
                    'Select Group',
                    style: TextStyle(color: Colors.black),
                  ),
                  decoration: InputDecoration(
                    filled: true, //<-- SEE HERE
                    fillColor: const Color.fromARGB(255, 225, 225, 225),
                    labelText: 'Group',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  onChanged: (newValue) {
                    customerController.GroupCode.value =
                        customerController.BPGroupCodeMapData[newValue];
                  },
                  items: customerController.BPGroupCodeList.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ), //group

                const SizedBox(height: 16.0),

                DropdownButtonFormField<String>(
                  hint: Text(
                    'All Currencies',
                    style: TextStyle(color: Colors.black),
                  ),
                  decoration: InputDecoration(
                    filled: true, //<-- SEE HERE
                    fillColor: const Color.fromARGB(255, 225, 225, 225),
                    labelText: 'Currency',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  onChanged: (newValue) {
                    customerController.Currencies.value =
                        customerController.BPCurrenciesMapData[newValue];
                  },
                  items:
                      customerController.BPCurrenciesList.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 16.0),

                CustomTextField(
                  hintText: 'Federal Tax id',
                  onChanged: (p0) =>
                      customerController.Federal_tax_id.value = p0,
                ), //federal tax id
                const SizedBox(height: 16.0),

                DropdownButtonFormField<String>(
                  hint: Text(
                    'Select Employee',
                    style: TextStyle(color: Colors.black),
                  ),
                  decoration: InputDecoration(
                    filled: true, //<-- SEE HERE
                    fillColor: const Color.fromARGB(255, 225, 225, 225),
                    labelText: 'Sales Employee',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  onChanged: (newValue) {
                    customerController.SaleEmployeesCode.value =
                        customerController.BPSaleEmployeesMapData[newValue];
                  },
                  items: customerController.BPSaleEmployeesList.map(
                      (String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
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

                SizedBox(height: 16.0),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ButtonBS(
                      height: 40,
                      width: 100,
                      borderRadius: 12,
                      backgroundColor: Colors.blue,
                      textColor: Colors.white,
                      title: 'Next',
                      onPressed: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => CustomerPage_2()));
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

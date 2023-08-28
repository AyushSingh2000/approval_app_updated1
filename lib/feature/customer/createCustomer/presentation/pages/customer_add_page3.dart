// ignore_for_file: invalid_use_of_protected_member

import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:new_app/core/post_enum_response.dart';
import 'package:new_app/feature/customer/createCustomer/controller/customer_controller.dart';
import 'package:new_app/ui/Buttons/buttonBS.dart';
import 'package:new_app/ui/TextField/customTextField.dart';
import 'package:new_app/ui/colors/app_colors.dart';
import 'package:quickalert/quickalert.dart';


import '../../../approved_bp/controller/approved_bp_controller.dart';
import '../../../../login/controller/login_controller.dart';
import '../../data/model/BP_post_1.dart';

class CustomerPage_3 extends StatefulWidget {
  const CustomerPage_3({super.key});

  @override
  State<CustomerPage_3> createState() => _CustomerPage_3State();
}

class _CustomerPage_3State extends State<CustomerPage_3> {
  LoginController lc = Get.put(LoginController());
  ApprovedBpController ac =
      Get.put<ApprovedBpController>(ApprovedBpController());

  int count = 0;
  final CustomerController customerController = Get.find<CustomerController>();
  // void add_address(bool checked) {
  //   bPAddresses addresslist1 = bPAddresses(
  //     AddressName: "ABC CHEMICAL EXPORTS PVT LTD",
  //     AddressType: "bo_BillTo",
  //     AddressName2: "PHYSICAL ADDRESS: U2 058, P.O. BOX 8330",
  //     AddressName3: "SAIF ZONE, SHARJAH",
  //     BuildingFloorRoom: "",
  //     Street: null,
  //     Block: null,
  //     ZipCode: null,
  //     City: null,
  //     Country: "AE",
  //     State: null,
  //     U_SCCode: null,
  //   );
  //   customerController.addresslist.add(addresslist1);
  //   if (checked) {
  //     bPAddresses addresslist2 = bPAddresses(
  //       AddressName: "ABC CHEMICAL EXPORTS PVT LTD",
  //       AddressType: "bo_ShipTo",
  //       AddressName2: "PHYSICAL ADDRESS: U2 058, P.O. BOX 8330",
  //       AddressName3: "SAIF ZONE, SHARJAH",
  //       BuildingFloorRoom: "",
  //       Street: null,
  //       Block: null,
  //       ZipCode: null,
  //       City: null,
  //       Country: "AE",
  //       State: null,
  //       U_SCCode: null,
  //     );
  //     customerController.addresslist.add(addresslist2);
  //   } else {
  //     bPAddresses addresslist2 = bPAddresses(
  //       AddressName: "ABC CHEMICAL EXPORTS PVT LTD",
  //       AddressType: "bo_ShipTo",
  //       AddressName2: "PHYSICAL ADDRESS: U2 058, P.O. BOX 8330",
  //       AddressName3: "SAIF ZONE, SHARJAH",
  //       BuildingFloorRoom: "",
  //       Street: null,
  //       Block: null,
  //       ZipCode: null,
  //       City: null,
  //       Country: "AE",
  //       State: null,
  //       U_SCCode: null,
  //     );
  //     customerController.addresslist.add(addresslist2);
  //   }
  // }

  void add_address(bool checked) {
    bPAddresses addresslist1 = bPAddresses(
      AddressName: customerController.Adrs_Building_Floor_Room.value,
      AddressType: customerController.Adrs_Address_Type.value,
      AddressName2: customerController.blank.value,
      AddressName3: customerController.blank.value,
      BuildingFloorRoom: customerController.Adrs_Building_Floor_Room.value,
      Street: customerController.Adrs_Street.value,
      Block: customerController.Adrs_Block.value,
      ZipCode: customerController.Adrs_Zip_Code.value,
      City: customerController.Adrs_City.value,
      Country: customerController.Adrs_Country.value,
      State: customerController.Adrs_State.value,
      U_SCCode: customerController.Adrs_Ship_To_County.value,
    );
    customerController.addresslist.add(addresslist1);
    if (checked) {
      bPAddresses addresslist2 = bPAddresses(
        AddressName: customerController.Adrs_Building_Floor_Room.value,
        AddressType: customerController.Adrs_s2_Address_Type.value,
        AddressName2: customerController.blank.value,
        AddressName3: customerController.blank.value,
        BuildingFloorRoom: customerController.Adrs_Building_Floor_Room.value,
        Street: customerController.Adrs_Street.value,
        Block: customerController.Adrs_Block.value,
        ZipCode: customerController.Adrs_Zip_Code.value,
        City: customerController.Adrs_City.value,
        Country: customerController.Adrs_Country.value,
        State: customerController.Adrs_State.value,
        U_SCCode: customerController.Adrs_Ship_To_County.value,
      );
      customerController.addresslist.add(addresslist2);
    } else {
      bPAddresses addresslist2 = bPAddresses(
        AddressName: customerController.Adrs_s2_Building_Floor_Room.value,
        AddressType: customerController.Adrs_s2_Address_Type.value,
        AddressName2: customerController.blank.value,
        AddressName3: customerController.blank.value,
        BuildingFloorRoom: customerController.Adrs_s2_Building_Floor_Room.value,
        Street: customerController.Adrs_s2_Street.value,
        Block: customerController.Adrs_s2_Block.value,
        ZipCode: customerController.Adrs_s2_Zip_Code.value,
        City: customerController.Adrs_s2_City.value,
        Country: customerController.Adrs_s2_Country.value,
        State: customerController.Adrs_s2_State.value,
        U_SCCode: customerController.Adrs_s2_Ship_To_County.value,
      );
      customerController.addresslist.add(addresslist2);
    }
  }

  bool isChecked = true;
  @override
  Widget build(BuildContext context) {
    print("From Cutomer Page 3");
    print(lc.databaseList);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appbarmainblue,
        title: const Text(
          'Add address',
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Obx(() {
                final bpcountryList = customerController.BPCountriesList.map(
                    (element) => element.toString()).toList();
                final bpstateList = customerController.BPStatestempList.map(
                    (element) => element.toString()).toList();
                final bpcountyList = customerController.BPCountyList.map(
                    (element) => element.toString()).toList();
                final databaseList = lc.databaseList;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Billing Address',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 16.0),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 0),
                      height: 60,
                      child: TextDropdownFormField(
                        decoration: InputDecoration(
                          // enabled: false,
                          labelText: 'Select County',
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
                          // hintText: 'Select Country',
                          filled: true,
                          hintStyle: const TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                          contentPadding: const EdgeInsets.only(
                              left: 12, right: 12, top: 20),
                          isCollapsed: true,
                        ),
                        options: bpcountyList,
                        onChanged: (dynamic newValue) {
                          customerController.Adrs_Ship_To_County.value =
                              customerController.BPCountyMapData[newValue];
                        },
                      ),
                    ),

                    const SizedBox(height: 16.0),

                    CustomTextField(
                      hintText: 'Address ID',
                      onChanged: (p0) =>
                          customerController.Adrs_AddressID.value = p0,
                    ),
                    SizedBox(height: 16.0),

                    CustomTextField(
                      hintText: 'Building/Floor/Room',
                      onChanged: (p0) => customerController
                          .Adrs_Building_Floor_Room.value = p0,
                    ), //Building/Floor/Room
                    const SizedBox(height: 16.0),
                    CustomTextField(
                      hintText: 'Block',
                      onChanged: (p0) =>
                          customerController.Adrs_Block.value = p0,
                    ), //Block
                    const SizedBox(height: 16.0),
                    CustomTextField(
                      hintText: 'Street',
                      onChanged: (p0) =>
                          customerController.Adrs_Street.value = p0,
                    ), //Street
                    const SizedBox(height: 16.0),

                    CustomTextField(
                      hintText: 'City',
                      onChanged: (p0) =>
                          customerController.Adrs_City.value = p0,
                    ),
                    const SizedBox(height: 16.0),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 0),
                      height: 60,
                      child: TextDropdownFormField(
                        decoration: InputDecoration(
                          // enabled: false,
                          labelText: 'Choose Country',
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
                          // hintText: 'Select Country',
                          filled: true,
                          hintStyle: const TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                          contentPadding: const EdgeInsets.only(
                              left: 12, right: 12, top: 20),
                          isCollapsed: true,
                        ),
                        options: bpcountryList,
                        onChanged: (dynamic newValue) {
                          customerController.createBPCountryStateMap(newValue!);
                          print(newValue);
                          customerController.Adrs_Country.value =
                              customerController.BPCountriesMapData[newValue];
                        },
                      ),
                    ),

                    const SizedBox(height: 16.0),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 0),
                      height: 60,
                      child: TextDropdownFormField(
                        decoration: InputDecoration(
                          // enabled: false,
                          labelText: bpstateList.isEmpty
                              ? 'No State Found'
                              : 'Select State',
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
                          contentPadding: const EdgeInsets.only(
                              left: 12, right: 12, top: 20),
                          isCollapsed: true,
                        ),
                        options: bpstateList,
                        onChanged: (dynamic newValue) {
                          customerController.Adrs_State.value =
                              customerController.BPStatesMaptempData[newValue];
                        },
                      ),
                    ),
                    const SizedBox(height: 16.0),

                    CustomTextField(
                      keyboardType: TextInputType.phone,
                      hintText: 'Zip',
                      onChanged: (p0) =>
                          customerController.Adrs_Zip_Code.value = p0,
                    ), //Zip Code

                    const SizedBox(height: 16.0),

                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 0),
                      height: 60,
                      child: DropdownButtonFormField<String>(
                        hint: const Text(
                          'Select Database',
                          style: TextStyle(color: Colors.black),
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color.fromARGB(255, 225, 225, 225),
                          labelText: 'Database',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        value: null,
                        onChanged: (String? newValue) {
                          if (newValue != null) {
                            if (customerController.database.value
                                .contains(newValue)) {
                              customerController.database.value
                                  .remove(newValue);
                            } else {
                              customerController.database.value.add(newValue);
                            }
                            customerController.database.refresh();
                            customerController.dbString.value =
                                customerController.database.join(';');
                          }
                        },
                        items: databaseList.map((option) {
                          return DropdownMenuItem<String>(
                            value: option,
                            child: Row(
                              children: [
                                Icon(
                                  customerController.database.value
                                          .contains(option)
                                      ? Icons.check_box
                                      : Icons.check_box_outline_blank,
                                  color: customerController.database.value
                                          .contains(option)
                                      ? Colors.blue
                                      : Colors.black,
                                ),
                                SizedBox(width: 8),
                                Text(option),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    Wrap(
                      children: customerController.database.value
                          .map((selectedOption) {
                        return Chip(
                          label: Text(selectedOption),
                          onDeleted: () {
                            customerController.database.value
                                .remove(selectedOption);
                            customerController.database.refresh();
                          },
                        );
                      }).toList(),
                    )
                  ],
                );
              }),
              const SizedBox(height: 25.0),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text(
                  'Same as billing address',
                ),
                leading: Checkbox(
                  value: isChecked,
                  materialTapTargetSize: MaterialTapTargetSize.padded,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value!;
                    });
                  },
                ),
              ),
              const SizedBox(height: 25.0),
              if (!isChecked)
                Obx(() {
                  // final bpcountryList = customerController.BPCountriesList.map(
                  //     (element) => element.toString()).toList();
                  // final bpstateList = customerController.BPStatestempList.map(
                  //     (element) => element.toString()).toList();
                  final bpcountryList = customerController.BPCountriesList.map(
                      (element) => element.toString()).toList();
                  final bpstateList = customerController.BPStatestempList.map(
                      (element) => element.toString()).toList();
                  final bpcountyList = customerController.BPCountyList.map(
                      (element) => element.toString()).toList();
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Shipping Address',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 16.0),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 0),
                        height: 60,
                        child: TextDropdownFormField(
                          decoration: InputDecoration(
                            // enabled: false,
                            labelText: 'Select County',
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
                            // hintText: 'Select Country',
                            filled: true,
                            hintStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            contentPadding: const EdgeInsets.only(
                                left: 12, right: 12, top: 20),
                            isCollapsed: true,
                          ),
                          options: bpcountyList,
                          onChanged: (dynamic newValue) {
                            customerController.Adrs_s2_Ship_To_County.value =
                                customerController.BPCountyMapData[newValue];
                          },
                        ),
                      ),

                      const SizedBox(height: 16.0),

                      CustomTextField(
                        hintText: 'Address ID',
                        onChanged: (p0) =>
                            customerController.Adrs_s2_AddressID.value = p0,
                      ),
                      SizedBox(height: 16.0),

                      CustomTextField(
                        hintText: 'Building/Floor/Room',
                        onChanged: (p0) => customerController
                            .Adrs_s2_Building_Floor_Room.value = p0,
                      ), //Building/Floor/Room
                      const SizedBox(height: 16.0),
                      CustomTextField(
                        hintText: 'Block',
                        onChanged: (p0) =>
                            customerController.Adrs_s2_Block.value = p0,
                      ), //Block
                      const SizedBox(height: 16.0),
                      CustomTextField(
                        hintText: 'Street',
                        onChanged: (p0) =>
                            customerController.Adrs_s2_Street.value = p0,
                      ), //Street
                      const SizedBox(height: 16.0),

                      CustomTextField(
                        hintText: 'City',
                        onChanged: (p0) =>
                            customerController.Adrs_s2_City.value = p0,
                      ),
                      const SizedBox(height: 16.0),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 0),
                        height: 60,
                        child: TextDropdownFormField(
                          decoration: InputDecoration(
                            // enabled: false,
                            labelText: 'Choose Country',
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
                            // hintText: 'Select Country',
                            filled: true,
                            hintStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            contentPadding: const EdgeInsets.only(
                                left: 12, right: 12, top: 20),
                            isCollapsed: true,
                          ),
                          options: bpcountryList,
                          onChanged: (dynamic newValue) {
                            customerController
                                .createBPCountryStateMap(newValue!);
                            print(newValue);
                            customerController.Adrs_s2_Country.value =
                                customerController.BPCountriesMapData[newValue];
                          },
                        ),
                      ),

                      const SizedBox(height: 16.0),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 0),
                        height: 60,
                        child: TextDropdownFormField(
                          decoration: InputDecoration(
                            // enabled: false,
                            labelText: bpstateList.isEmpty
                                ? 'No State Found'
                                : 'Select State',
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
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            contentPadding: const EdgeInsets.only(
                                left: 12, right: 12, top: 20),
                            isCollapsed: true,
                          ),
                          options: bpstateList,
                          onChanged: (dynamic newValue) {
                            customerController.Adrs_s2_State.value =
                                customerController
                                    .BPStatesMaptempData[newValue];
                          },
                        ),
                      ),
                      const SizedBox(height: 16.0),

                      CustomTextField(
                        keyboardType: TextInputType.phone,
                        hintText: 'Zip',
                        onChanged: (p0) =>
                            customerController.Adrs_s2_Zip_Code.value = p0,
                      ), //Zip Code
                    ],
                  );
                }),
              const SizedBox(
                height: 16,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                ButtonBS(
                  height: 40,
                  borderRadius: 12,
                  backgroundColor: Colors.blue,
                  textColor: Colors.white,
                  title: Text('Back'),
                  onPressed: () {
                    Get.back();
                  },
                ),
                Obx(() {
                  if (customerController.postCustomerDataLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  return ButtonBS(
                    height: 40,
                    borderRadius: 12,
                    backgroundColor: Colors.blue,
                    textColor: Colors.white,
                    title: Text('Submit'),
                    onPressed: () async {
                      customerController.addresslist.value = [];
                      add_address(isChecked);
                      // print(customerController.addresslist[2].AddressType);
                      final res = await customerController.postCustomerData();
                      // print('qwertyuio${res.postResponseEnum}');
                      if (res.postResponseEnum == PostResponseEnum.error ||
                          res.postResponseEnum == PostResponseEnum.failed) {
                        print(res.message);
                        // ignore: use_build_context_synchronously
                        await QuickAlert.show(
                            context: context,
                            type: QuickAlertType.error,
                            text: res.message == "default"
                                ? "Server Error"
                                : res.message);

                        return;
                      } else {
                        await ac.getApprovedCustomerData();
                        ac.filterData('');
                        await QuickAlert.show(
                          context: context,
                          type: QuickAlertType.success,
                          text: res.message,
                        );

                        Navigator.popUntil(context, (route) {
                          return count++ == 3;
                        });
                      }
                      // lc.pageNumber.value == 0;
                      // lc.update();
                      // Get.to(Customer_add());
                    },
                  );
                })
              ]),
              const SizedBox(
                height: 25,
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
// ignore: unused_import
import 'package:new_app/feature/customer/createCustomer/presentation/widgets/add_contact.dart';
import 'package:new_app/ui/colors/app_colors.dart';
import 'package:new_app/ui/widgets/card.dart';

import '../../../../../ui/TextField/customTextField.dart';
import '../../../../customer/approved_bp/controller/approved_bp_controller.dart';
import '../../../../login/controller/login_controller.dart';
import '../../controller/Approved_supplier_controller.dart';
import 'detailed_bp.dart';

class ApprovedSupplierScreen extends StatefulWidget {
  const ApprovedSupplierScreen({super.key});

  @override
  State<ApprovedSupplierScreen> createState() => _ApprovedSupplierScreenState();
}

class _ApprovedSupplierScreenState extends State<ApprovedSupplierScreen> {
  final LoginController lc = Get.find<LoginController>();
  ApprovedSupplierController ac = Get.put(ApprovedSupplierController());

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   ac.filteredData.assignAll(ac.GetBPApprovalStatusList);
  //   ac.searchToggle.value = false;
  //   ac.searchToggle.refresh();
  //   super.dispose();
  // }
  List<String> sort = ['CardName', 'CardCode', 'GroupName', 'RequestedBy'];
  String selectedValue = '';
  @override
  Widget build(BuildContext context) {
    ApprovedSupplierController ac = Get.put(ApprovedSupplierController());
    // ac.getApprovedCustomerData();
    ac.filteredData.assignAll(ac.GetApprovedStatusList);
    ac.filteredData.refresh();
    ac.searchToggle.value = false;
    ac.searchToggle.refresh();
    ac.sortToggle.value = false;
    ac.sortToggle.refresh();

    print(ac.GetApprovedStatusList.length);
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          backgroundColor: AppColors.appbarmainblue,
          title: Text('Approved Suppliers'),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: GestureDetector(
                  onTap: () {
                    ac.sortToggle.value = !ac.sortToggle.value;
                    ac.sortToggle.refresh();
                  },
                  child: Container(
                      height: 30, width: 25, child: Icon(Icons.sort))),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: GestureDetector(
                  onTap: () {
                    ac.filteredData.assignAll(ac.GetApprovedStatusList);

                    ac.searchToggle.value = !ac.searchToggle.value;
                    ac.searchToggle.refresh();
                  },
                  child: Container(
                      height: 30, width: 25, child: Icon(Icons.search))),
            )
          ],
        ),
        body: Obx(() => ac.initialDataLoading.value == true
            ? Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  ac.searchToggle == true
                      ? Padding(
                          padding: const EdgeInsets.only(
                              left: 12.0, right: 12, top: 10),
                          child: Container(
                            height: 50,
                            child: CustomTextField(
                                contentPadding:
                                    EdgeInsets.only(top: 10, left: 20),
                                hintText: 'Search',
                                onChanged: (query) {
                                  ac.filterData(query);
                                }),
                          ),
                        )
                      : SizedBox(),
                  ac.sortToggle == true
                      ? Container(
                          margin: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: const Color.fromARGB(255, 226, 226, 226)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('sort by'),
                              DropdownButton<String>(
                                value: ac.selectedValue_approved.value == ''
                                    ? sort[0]
                                    : ac.selectedValue_approved.value,
                                onChanged: (newValue) {
                                  ac.selectedValue_approved.value = newValue!;
                                  print(ac.selectedValue_approved.value);
                                  ac.filteredData.sort((a, b) {
                                    var aValue, bValue;

                                    // Determine which field to sort by based on selectedValue
                                    switch (ac.selectedValue_approved.value) {
                                      case 'CardName':
                                        aValue = a.bpmasterDetails[0].CardName;
                                        bValue = b.bpmasterDetails[0].CardName;
                                        break;
                                      case 'CardCode':
                                        aValue = a.bpmasterDetails[0].CardCode;
                                        bValue = b.bpmasterDetails[0].CardCode;

                                        break;
                                      case 'GroupName':
                                        aValue = a.bpmasterDetails[0].GroupName;
                                        bValue = b.bpmasterDetails[0].GroupName;
                                        break;
                                      case 'RequestedBy':
                                        aValue =
                                            a.bpmasterDetails[0].RequestedBy;
                                        bValue =
                                            b.bpmasterDetails[0].RequestedBy;
                                        break;
                                      default:
                                        aValue = a.bpmasterDetails[0]
                                            .CardCode; // Default to CardName if none selected
                                        bValue = b.bpmasterDetails[0].CardCode;
                                    }

                                    // For other fields, sort in ascending order
                                    final comparisonResult =
                                        aValue != null && bValue != null
                                            ? aValue
                                                .toString()
                                                .compareTo(bValue.toString())
                                            : 0;

                                    return comparisonResult;
                                  });
                                },
                                icon: Icon(Icons.sort),
                                borderRadius: BorderRadius.circular(12),
                                dropdownColor:
                                    const Color.fromARGB(255, 230, 230, 230),
                                items: sort.map<DropdownMenuItem<String>>(
                                    (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                hint: Text('Select an option'),
                              ),
                            ],
                          ),
                        )
                      : SizedBox(),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, bottom: 5),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Select Database',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        )),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 0),
                    height: 60,
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: TextDropdownFormField(
                      decoration: InputDecoration(
                        // enabled: false,
                        labelText: ac.selectDb.value,
                        enabled: true,
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
                      options: lc.databaseList,
                      onChanged: (dynamic newValue) {
                        ac.selectDb.value = newValue;
                        Future.delayed(Duration(milliseconds: 100), () async {
                          ac.initialDataLoading.value = true;
                          await ac.getApprovedSupplierData();
                          ac.initialDataLoading.value = false;
                          ac.filterData('');
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Expanded(
                    child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        // itemCount: ac.GetBPApprovalStatusList.length,
                        itemCount: ac.filteredData.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              // print(ac.GetBPApprovalStatusList[index]
                              //     .bpmasterDetails[0].CardCode);
                              ac.cardCode.value = ac.filteredData[index]
                                      .bpmasterDetails[0].CardCode ??
                                  '';

                              // print(ac.cardCode.value);
                              // ac.getBPDetailsData();
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) =>
                                          DetailedSupplierScreen(
                                            name: ac
                                                    .filteredData[index]
                                                    .bpmasterDetails[0]
                                                    .CardName ??
                                                '',
                                            code: ac
                                                    .filteredData[index]
                                                    .bpmasterDetails[0]
                                                    .CardCode ??
                                                '',
                                          )));
                              ac.searchToggle.value = false;
                              ac.searchToggle.refresh();
                              Future.delayed(Duration(milliseconds: 500), () {
                                ac.filterData('');
                              });
                            },
                            child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 5),
                                child: ProfileCard(
                                  cardName: ac.filteredData[index]
                                          .bpmasterDetails[0].CardName ??
                                      '',
                                  cardCode: ac.filteredData[index]
                                          .bpmasterDetails[0].CardCode ??
                                      '',
                                  groupName: ac.filteredData[index]
                                          .bpmasterDetails[0].GroupName ??
                                      '',
                                )),
                          );
                        }),
                  )
                ],
              )));
  }
}

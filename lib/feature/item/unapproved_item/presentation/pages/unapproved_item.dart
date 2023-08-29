import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:new_app/feature/login/controller/login_controller.dart';
import 'package:new_app/ui/colors/app_colors.dart';

import '../../../../../ui/TextField/customTextField.dart';
import '../../../../../ui/widgets/card.dart';
import '../../../approved_item/controller/approved_item_controller.dart';
import '../../controller/unApproved_item_controller.dart';
import '../pages/detailed_items.dart';

class UnApprovedItemScreen extends StatefulWidget {
  const UnApprovedItemScreen({super.key});

  @override
  State<UnApprovedItemScreen> createState() => _UnApprovedItemScreenState();
}

class _UnApprovedItemScreenState extends State<UnApprovedItemScreen> {
  LoginController lc = Get.put(LoginController());
  List<String> sort = ['CardName', 'CardCode', 'GroupName', 'RequestedBy'];
  @override
  Widget build(BuildContext context) {
    final UnApprovedItemController ac = Get.put(UnApprovedItemController());
    // print(ac.GetItemApprovalStatusList[67].itemmasterDetails[0].ApprovalStatus);
    // print(ac.GetItemApprovalStatusList.length);
    ac.filteredData.assignAll(ac.GetUnApprovedStatusList);
    ac.filteredData.refresh();
    ac.searchToggle.value = false;
    ac.searchToggle.refresh();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.appbarmainblue,
          title: Text('UnApproved Items'),
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
                    ac.filteredData.assignAll(ac.GetUnApprovedStatusList);

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
                                        aValue =
                                            a.itemmasterDetails[0].ItemName;
                                        bValue =
                                            b.itemmasterDetails[0].ItemName;
                                        break;
                                      case 'CardCode':
                                        aValue =
                                            a.itemmasterDetails[0].ItemCode;
                                        bValue =
                                            b.itemmasterDetails[0].ItemCode;

                                        break;
                                      case 'GroupName':
                                        aValue =
                                            a.itemmasterDetails[0].GroupName;
                                        bValue =
                                            b.itemmasterDetails[0].GroupName;
                                        break;
                                      case 'RequestedBy':
                                        aValue =
                                            a.itemmasterDetails[0].RequestedBy;
                                        bValue =
                                            b.itemmasterDetails[0].RequestedBy;
                                        break;
                                      default:
                                        aValue = a.itemmasterDetails[0]
                                            .ItemCode; // Default to CardName if none selected
                                        bValue =
                                            b.itemmasterDetails[0].ItemCode;
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
                          await ac.getUnApprovedItemData();
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
                        itemCount: ac.filteredData.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              ac.itemCode.value = ac.filteredData[index]
                                      .itemmasterDetails[0].ItemCode ??
                                  '';
                              // print(ac.cardCode.value);
                              // ac.getBPDetailsData();
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) =>
                                          DetailedUnApprovedItemScreen(
                                              name: ac
                                                      .filteredData[index]
                                                      .itemmasterDetails[0]
                                                      .ItemName ??
                                                  '',
                                              code: ac
                                                      .filteredData[index]
                                                      .itemmasterDetails[0]
                                                      .ItemCode ??
                                                  '',
                                              group: ac
                                                      .filteredData[index]
                                                      .itemmasterDetails[0]
                                                      .GroupName ??
                                                  '')));
                              ac.searchToggle.value = false;
                              ac.searchToggle.refresh();
                              ac.filterData('');
                            },
                            child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 5),
                                child: ProfileCard(
                                  cardName: ac.filteredData[index]
                                          .itemmasterDetails[0].ItemName ??
                                      '',
                                  cardCode: ac.filteredData[index]
                                          .itemmasterDetails[0].ItemCode ??
                                      '',
                                  groupName: ac.filteredData[index]
                                          .itemmasterDetails[0].GroupName ??
                                      '',
                                )),
                          );
                        }),
                  ),
                ],
              )));
  }
}

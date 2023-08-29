import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:new_app/ui/colors/app_colors.dart';

import '../../../../../ui/TextField/customTextField.dart';
import '../../../../../ui/widgets/card.dart';
import '../../../../login/controller/login_controller.dart';
import '../../controller/unapproved_bp_controller.dart';
import '../pages/detailed_bp.dart';
import '../../../approved_bp/controller/approved_bp_controller.dart';

class UnApprovedBPScreen extends StatefulWidget {
  const UnApprovedBPScreen({super.key});

  @override
  State<UnApprovedBPScreen> createState() => _UnApprovedBPScreenState();
}

class _UnApprovedBPScreenState extends State<UnApprovedBPScreen> {
  List<String> sort = ['CardName', 'CardCode', 'GroupName', 'RequestedBy'];
  String selectedValue = '';
  final LoginController lc = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    UnApprovedBpController ac =
        Get.put<UnApprovedBpController>(UnApprovedBpController());
    ac.filteredData_unApproved.assignAll(ac.GetBPUN_ApprovalStatusList);
    ac.filteredData_unApproved.refresh();
    ac.searchToggle.value = false;
    ac.searchToggle.refresh();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appbarmainblue,
        title: Text('Un-Approved Customers'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: GestureDetector(
                onTap: () {
                  ac.sortToggle.value = !ac.sortToggle.value;
                  ac.sortToggle.refresh();
                },
                child:
                    Container(height: 30, width: 25, child: Icon(Icons.sort))),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: GestureDetector(
                onTap: () {
                  ac.filteredData_unApproved
                      .assignAll(ac.GetBPUN_ApprovalStatusList);

                  ac.searchToggle.value = !ac.searchToggle.value;
                  ac.searchToggle.refresh();
                },
                child: Container(
                    height: 30, width: 25, child: Icon(Icons.search))),
          ),
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
                                ac.filterData_UN(query);
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
                              value: ac.selectedValue.value == ''
                                  ? sort[0]
                                  : ac.selectedValue.value,
                              onChanged: (newValue) {
                                // print(ac.filteredData[0].bpmasterDetails[0]
                                //     .CardName);
                                ac.selectedValue.value = newValue!;
                                print(ac.selectedValue.value);
                                ac.filteredData_unApproved.sort((a, b) {
                                  var aValue, bValue;

                                  // Determine which field to sort by based on selectedValue
                                  switch (ac.selectedValue.value) {
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
                                      aValue = a.bpmasterDetails[0].RequestedBy;
                                      bValue = b.bpmasterDetails[0].RequestedBy;
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
                        await ac.getUn_ApprovedCustomerData();
                        ac.initialDataLoading.value = false;
                        ac.filterData_UN('');
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Obx(
                  () => Expanded(
                    child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: ac.filteredData_unApproved.length,
                        itemBuilder: (context, index) {
                          return ac.filteredData_unApproved[index]
                                      .bpmasterDetails[0].ApprovalStatus !=
                                  'Approved'
                              ? GestureDetector(
                                  onTap: () {
                                    ac.cardCode.value = ac
                                            .filteredData_unApproved[index]
                                            .bpmasterDetails[0]
                                            .CardCode ??
                                        '';
                                    // print(ac.cardCode.value);
                                    // ac.getBPDetailsData();
                                    Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                            builder: (context) =>
                                                DetailedBpScreen(
                                                  name: ac
                                                          .filteredData_unApproved[
                                                              index]
                                                          .bpmasterDetails[0]
                                                          .CardName ??
                                                      '',
                                                  code: ac
                                                          .filteredData_unApproved[
                                                              index]
                                                          .bpmasterDetails[0]
                                                          .CardCode ??
                                                      '',
                                                  group: ac
                                                          .filteredData_unApproved[
                                                              index]
                                                          .bpmasterDetails[0]
                                                          .GroupName ??
                                                      '',
                                                  requestedBy: ac
                                                          .filteredData_unApproved[
                                                              index]
                                                          .bpmasterDetails[0]
                                                          .RequestedBy ??
                                                      '',
                                                  db: ac
                                                          .filteredData_unApproved[
                                                              index]
                                                          .bpmasterDetails[0]
                                                          .ApplyDBs ??
                                                      '',
                                                )));
                                    ac.searchToggle.value = false;
                                    ac.searchToggle.refresh();
                                    Future.delayed(Duration(milliseconds: 500),
                                        () {
                                      ac.filterData_UN('');
                                    });
                                  },
                                  child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0, vertical: 8),
                                      child: ProfileCard(
                                        cardName: ac
                                                .filteredData_unApproved[index]
                                                .bpmasterDetails[0]
                                                .CardName ??
                                            '',
                                        cardCode: ac
                                                .filteredData_unApproved[index]
                                                .bpmasterDetails[0]
                                                .CardCode ??
                                            '',
                                        groupName: ac
                                                .filteredData_unApproved[index]
                                                .bpmasterDetails[0]
                                                .GroupName ??
                                            '',
                                      )),
                                )
                              : SizedBox();
                        }),
                  ),
                )
              ],
            )),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:new_app/feature/approved_bp/controller/approved_bp_controller.dart';
import 'package:new_app/feature/customer/presentation/widgets/add_contact.dart';
import 'package:new_app/ui/widgets/card.dart';

import '../../../../ui/TextField/customTextField.dart';
import '../../../login/controller/login_controller.dart';
import 'detailed_bp.dart';

class ApprovedBPScreen extends StatefulWidget {
  const ApprovedBPScreen({super.key});

  @override
  State<ApprovedBPScreen> createState() => _ApprovedBPScreenState();
}

class _ApprovedBPScreenState extends State<ApprovedBPScreen> {
  final LoginController lc = Get.find<LoginController>();
  ApprovedBpController ac = Get.put(ApprovedBpController());

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   ac.filteredData.assignAll(ac.GetBPApprovalStatusList);
  //   ac.searchToggle.value = false;
  //   ac.searchToggle.refresh();
  //   super.dispose();
  // }

  @override
  List<String> sort = ['name', 'cardcode'];
  String selectedValue = '';
  Widget build(BuildContext context) {
    ApprovedBpController ac = Get.put(ApprovedBpController());
    ac.filteredData.assignAll(ac.GetBPApprovalStatusList);
    ac.filteredData.refresh();
    ac.searchToggle.value = false;
    ac.searchToggle.refresh();
    print(ac.GetBPApprovalStatusList.length);
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          title: Text('Approved BP List'),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: GestureDetector(
                  onTap: () {
                    ac.filteredData.assignAll(ac.GetBPApprovalStatusList);

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
                  Container(
                    margin: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: const Color.fromARGB(255, 226, 226, 226)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('sort by'),
                        DropdownButton<String>(
                          value: selectedValue == '' ? sort[0] : selectedValue,
                          onChanged: (newValue) {
                            setState(() {
                              selectedValue = newValue!;
                              ac.GetBPApprovalStatusList.sort((a, b) => a
                                  .bpmasterDetails[0].CardName!
                                  .compareTo(b.bpmasterDetails[0].CardName!));
                            });
                          },
                          icon: Icon(Icons.sort),
                          borderRadius: BorderRadius.circular(12),
                          dropdownColor:
                              const Color.fromARGB(255, 230, 230, 230),
                          items: sort
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          hint: Text('Select an option'),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        // itemCount: ac.GetBPApprovalStatusList.length,
                        itemCount: ac.filteredData.length,
                        itemBuilder: (context, index) {
                          return ac.filteredData[index].bpmasterDetails[0]
                                      .ApprovalStatus ==
                                  'Approved'
                              ? GestureDetector(
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
                                                DetailedBpScreen(
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
                                    ac.filterData('');
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
                                )
                              : SizedBox();
                        }),
                  )
                ],
              )));
  }
}

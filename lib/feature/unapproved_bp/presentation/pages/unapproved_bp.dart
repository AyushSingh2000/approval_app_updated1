import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../ui/TextField/customTextField.dart';
import '../../../../ui/widgets/card.dart';
import '../pages/detailed_bp.dart';
import '../../../approved_bp/controller/approved_bp_controller.dart';

class UnApprovedBPScreen extends StatefulWidget {
  const UnApprovedBPScreen({super.key});

  @override
  State<UnApprovedBPScreen> createState() => _UnApprovedBPScreenState();
}

class _UnApprovedBPScreenState extends State<UnApprovedBPScreen> {
  // ApprovedBpController ac = Get.put(ApprovedBpController());

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   ac.filteredData.assignAll(ac.GetBPApprovalStatusList);
  //   ac.searchToggle.value = false;
  //   ac.searchToggle.refresh();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    ApprovedBpController ac =
        Get.put<ApprovedBpController>(ApprovedBpController());
    ac.filteredData_unApproved.assignAll(ac.GetBPApprovalStatusList);
    ac.filteredData_unApproved.refresh();
    ac.searchToggle.value = false;
    ac.searchToggle.refresh();
    // ac.getApprovalStatusData();
    return Scaffold(
      appBar: AppBar(
        title: Text('UnApproved BP List'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: GestureDetector(
                onTap: () {
                  ac.filteredData_unApproved
                      .assignAll(ac.GetBPApprovalStatusList);

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
                                ac.filterData_UN(query);
                              }),
                        ),
                      )
                    : SizedBox(),
                Expanded(
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
                                              )));
                                  ac.searchToggle.value = false;
                                  ac.searchToggle.refresh();
                                  ac.filterData_UN('');
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
              ],
            )),
    );
  }
}

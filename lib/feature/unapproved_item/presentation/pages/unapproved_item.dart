import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../../ui/TextField/customTextField.dart';
import '../../../../ui/widgets/card.dart';
import '../../../approved_item/controller/approved_item_controller.dart';
import '../pages/detailed_items.dart';

class UnApprovedItemScreen extends StatefulWidget {
  const UnApprovedItemScreen({super.key});

  @override
  State<UnApprovedItemScreen> createState() => _UnApprovedItemScreenState();
}

class _UnApprovedItemScreenState extends State<UnApprovedItemScreen> {
  @override
  Widget build(BuildContext context) {
    final ApprovedItemController ac = Get.put(ApprovedItemController());
    // print(ac.GetItemApprovalStatusList[67].itemmasterDetails[0].ApprovalStatus);
    // print(ac.GetItemApprovalStatusList.length);
    ac.filteredData_unApproved.assignAll(ac.GetItemApprovalStatusList);
    ac.filteredData_unApproved.refresh();
    ac.searchToggle.value = false;
    ac.searchToggle.refresh();
    return Scaffold(
        appBar: AppBar(
          title: Text('UnApproved Item List'),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: GestureDetector(
                  onTap: () {
                    ac.filteredData_unApproved
                        .assignAll(ac.GetItemApprovalStatusList);

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
                                  ac.filterData_Un(query);
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
                                      .itemmasterDetails[0].ApprovalStatus !=
                                  'Approved'
                              ? GestureDetector(
                                  onTap: () {
                                    ac.itemCode.value = ac
                                            .filteredData_unApproved[index]
                                            .itemmasterDetails[0]
                                            .ItemCode ??
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
                                                          .itemmasterDetails[0]
                                                          .ItemName ??
                                                      '',
                                                  code: ac
                                                          .filteredData_unApproved[
                                                              index]
                                                          .itemmasterDetails[0]
                                                          .ItemCode ??
                                                      '',
                                                )));
                                    ac.searchToggle.value = false;
                                    ac.searchToggle.refresh();
                                    ac.filterData_Un('');
                                  },
                                  child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0, vertical: 5),
                                      child: ProfileCard(
                                        cardName: ac
                                                .filteredData_unApproved[index]
                                                .itemmasterDetails[0]
                                                .ItemName ??
                                            '',
                                        cardCode: ac
                                                .filteredData_unApproved[index]
                                                .itemmasterDetails[0]
                                                .ItemCode ??
                                            '',
                                        groupName: ac
                                                .filteredData_unApproved[index]
                                                .itemmasterDetails[0]
                                                .GroupName ??
                                            '',
                                      )),
                                )
                              : SizedBox();
                        }),
                  ),
                ],
              )));
  }
}

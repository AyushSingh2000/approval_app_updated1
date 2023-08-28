// ignore_for_file: unused_local_variable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app/feature/item/approved_item/controller/approved_item_controller.dart';
import 'package:new_app/feature/item/unapproved_item/controller/unApproved_item_controller.dart';
import 'package:new_app/ui/colors/app_colors.dart';

import '../../../../../ui/Buttons/buttonBS.dart';
import '../../../../../ui/widgets/detailed_card.dart';
import '../../controller/rejected_item_controller.dart';
import '../edit/presentation/pages/items_add.dart';

class DetailedRejectedItemScreen extends StatefulWidget {
  final String name;
  final String code;
  const DetailedRejectedItemScreen(
      {required this.name, required this.code, Key? key})
      : super(key: key);

  @override
  State<DetailedRejectedItemScreen> createState() =>
      _DetailedRejectedItemScreenState();
}

class _DetailedRejectedItemScreenState
    extends State<DetailedRejectedItemScreen> {
  RejectedItemController ac = Get.put(RejectedItemController());
  ApprovedItemController apc = Get.put(ApprovedItemController());
  UnApprovedItemController uc = Get.put(UnApprovedItemController());
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ac.getItemDetailsData();
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.appbarmainblue,
          elevation: 0,
          title: const Text('Item Details'),
          actions: [
            Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => editRejectedItemsPage(
                                list: ac.GetItemDetailsList.value)));
                  },
                  icon: Icon(
                    Icons.edit_note_sharp,
                    size: 30,
                  ),
                )),
          ],
        ),
        body: Container(
          decoration: const BoxDecoration(
            color: AppColors.appbarmainblue, // Set the background color here
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30.0), // Adjust these values as needed
              topRight: Radius.circular(30.0),
            ),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white, // Set the background color here
              ),
              child: Obx(() => ac.detailsDataLoading.value == true
                  ? const Center(child: CircularProgressIndicator())
                  : Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            widget.name,
                            style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            widget.code,
                            style: const TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.w300,
                                color: AppColors.appbarmainblue),
                          ),
                          const SizedBox(height: 20.0),
                          DefaultTabController(
                            length: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                const TabBar(
                                  indicator: BoxDecoration(
                                      color: AppColors.appgrey,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  indicatorColor: AppColors.appbarmainblue,
                                  labelColor: AppColors
                                      .appbarmainblue, //  // Color of the selected tab
                                  unselectedLabelColor: Color(0xffd4d5d9),
                                  tabs: [
                                    Tab(text: "Item"),
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  height: height *
                                      0.63, // Adjust the height as needed
                                  child: TabBarView(
                                    children: [
                                      // Content for Tab 1
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 0, horizontal: 20),
                                        child: ListView(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8.0),
                                              child: DetailsCard(
                                                title: "Details",
                                                subtitleData: [
                                                  {
                                                    'subtitle': 'Code',
                                                    'text':
                                                        ac.GetItemDetailsList[0]
                                                                .ItemCode ??
                                                            "-"
                                                  },
                                                  {
                                                    'subtitle': 'Name',
                                                    'text':
                                                        ac.GetItemDetailsList[0]
                                                                .ItemName ??
                                                            "-"
                                                  },
                                                  {
                                                    'subtitle': 'Foreign Name',
                                                    'text':
                                                        ac.GetItemDetailsList[0]
                                                                .FrgnName ??
                                                            "-"
                                                  },
                                                  {
                                                    'subtitle': 'Item Type',
                                                    'text':
                                                        ac.GetItemDetailsList[0]
                                                                .ItmsGrpNam ??
                                                            "-"
                                                  }, //Doubt
                                                  {
                                                    'subtitle': 'Item Group',
                                                    'text':
                                                        ac.GetItemDetailsList[0]
                                                                .GroupName ??
                                                            "-"
                                                  },
                                                  {
                                                    'subtitle':
                                                        'Inventory Item',
                                                    'text':
                                                        ac.GetItemDetailsList[0]
                                                                .InvntItem ??
                                                            "-"
                                                  }, //Doubt
                                                  {
                                                    'subtitle': 'Sales Item',
                                                    'text':
                                                        ac.GetItemDetailsList[0]
                                                                .SellItem ??
                                                            "-"
                                                  }, //Doubt
                                                  {
                                                    'subtitle': 'Purchase Item',
                                                    'text':
                                                        ac.GetItemDetailsList[0]
                                                                .PrchseItem ??
                                                            "-"
                                                  }, //Doubt
                                                  //Sales UOM and Purchase UOM not found
                                                  {
                                                    'subtitle': 'Inventory UoM',
                                                    'text':
                                                        ac.GetItemDetailsList[0]
                                                                .InvntryUom ??
                                                            "-"
                                                  },
                                                  //Manufacturing Catolog No not found,
                                                  {
                                                    'subtitle':
                                                        'Manage Item By Batches',
                                                    'text':
                                                        ac.GetItemDetailsList[0]
                                                                .ManBtchNum ??
                                                            "-"
                                                  },
                                                  {
                                                    'subtitle':
                                                        'Manage Item By Serial',
                                                    'text':
                                                        ac.GetItemDetailsList[0]
                                                                .ManSerNum ??
                                                            "-"
                                                  },
                                                  //Management Method
                                                  {
                                                    'subtitle':
                                                        'On Every Transaction',
                                                    'text':
                                                        ac.GetItemDetailsList[0]
                                                                .MngMethod1 ??
                                                            "-"
                                                  },
                                                  {
                                                    'subtitle': 'On Release',
                                                    'text':
                                                        ac.GetItemDetailsList[0]
                                                                .MngMethod ??
                                                            "-"
                                                  },
                                                  // Valuation Method and Remaining no found
                                                  // {'subtitle': 'Website', 'text': ac.GetItemDetailsList[0].IntrntSite ?? "-"},
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            // Row(
                                            //   mainAxisAlignment:
                                            //       MainAxisAlignment.spaceEvenly,
                                            //   children: [
                                            //     Obx(
                                            //       () => ButtonBS(
                                            //         title: ac.load1.value ==
                                            //                 true
                                            //             ? const CircularProgressIndicator(
                                            //                 strokeWidth: 1,
                                            //                 color: Colors.white,
                                            //               )
                                            //             : const Text(
                                            //                 'Approve',
                                            //                 style: TextStyle(
                                            //                     color: Colors
                                            //                         .white),
                                            //               ),
                                            //         backgroundColor:
                                            //             const Color.fromARGB(
                                            //                 255, 33, 79, 243),
                                            //         textColor: Colors.white,
                                            //         fontWeight: FontWeight.w500,
                                            //         paddingAll: 16,
                                            //         borderRadius: 10,
                                            //         fontSize: 16,
                                            //         onPressed: () async {
                                            //           ac.load1.value = true;
                                            //           var res = await ac
                                            //               .updateItemDetailsData(
                                            //                   widget.code,
                                            //                   "Approved");
                                            //           ac.load1.value = false;

                                            //           if (ac.res.value ==
                                            //               'Success') {
                                            //             await ac
                                            //                 .getRejectedItemData();
                                            //             await apc
                                            //                 .getApprovedItemData();
                                            //             ac.filterData('');
                                            //             apc.filterData('');
                                            //             ScaffoldMessenger.of(
                                            //                     context)
                                            //                 .showSnackBar(const SnackBar(
                                            //                     content: Text(
                                            //                         'Successfully Approved')));
                                            //             Navigator.of(context)
                                            //                 .pop();
                                            //           } else {
                                            //             ScaffoldMessenger.of(
                                            //                     context)
                                            //                 .showSnackBar(const SnackBar(
                                            //                     content: Text(
                                            //                         'An Error has occurred')));
                                            //           }
                                            //         },
                                            //       ),
                                            //     ),
                                            //     Obx(
                                            //       () => ButtonBS(
                                            //         title: ac.load2.value ==
                                            //                 true
                                            //             ? const CircularProgressIndicator(
                                            //                 strokeWidth: 1,
                                            //                 color: Colors.black,
                                            //               )
                                            //             : const Text('Un-Approve'),
                                            //         backgroundColor:
                                            //             const Color.fromARGB(
                                            //                 255, 228, 228, 228),
                                            //         textColor:
                                            //             const Color.fromARGB(
                                            //                 255, 33, 79, 243),
                                            //         fontWeight: FontWeight.w500,
                                            //         paddingAll: 16,
                                            //         borderRadius: 10,
                                            //         fontSize: 16,
                                            //         onPressed: () async {
                                            //           ac.load2.value = true;
                                            //           var res = await ac
                                            //               .updateItemDetailsData(
                                            //                   widget.code,
                                            //                   "Un-Approved");
                                            //           ac.load2.value = false;
                                            //           if (ac.res.value ==
                                            //               "Success") {
                                            //             await ac
                                            //                 .getRejectedItemData();
                                            //             await uc
                                            //                 .getUnApprovedItemData();
                                            //             ac.filterData('');
                                            //             uc.filterData('');
                                            //             ScaffoldMessenger.of(
                                            //                     context)
                                            //                 .showSnackBar(const SnackBar(
                                            //                     content: Text(
                                            //                         'Successfully Un-Approved')));
                                            //             Navigator.of(context)
                                            //                 .pop();
                                            //           } else {
                                            //             ScaffoldMessenger.of(
                                            //                     context)
                                            //                 .showSnackBar(const SnackBar(
                                            //                     content: Text(
                                            //                         'An Error has occurred')));
                                            //           }
                                            //         },
                                            //       ),
                                            //     ),
                                            //   ],
                                            // ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
            ),
          ),
        ));
  }
}

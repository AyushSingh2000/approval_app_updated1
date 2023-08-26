// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../ui/widgets/detailed_card.dart';
import '../../controller/approved_item_controller.dart';

class DetailedBpScreen extends StatefulWidget {
  final String name;
  final String code;
  const DetailedBpScreen({required this.name, required this.code, Key? key})
      : super(key: key);

  @override
  State<DetailedBpScreen> createState() => _DetailedBpScreenState();
}

class _DetailedBpScreenState extends State<DetailedBpScreen> {
  ApprovedItemController ac = Get.put(ApprovedItemController());
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ac.getItemsDetailsData();
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text('Item Master Details'),
        ),
        body: Container(
          decoration: BoxDecoration(
            color: Colors.blue, // Set the background color here
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0), // Adjust these values as needed
              topRight: Radius.circular(30.0),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white, // Set the background color here
              ),
              child: Obx(() => ac.detailsDataLoading.value == true
                  ? Center(child: CircularProgressIndicator())
                  : Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            widget.name,
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            widget.code,
                            style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.w300,
                                color: Colors.blueAccent),
                          ),
                          SizedBox(height: 20.0),
                          DefaultTabController(
                            length: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                TabBar(
                                  labelColor: Colors
                                      .blueAccent, // Color of the selected tab
                                  unselectedLabelColor: Color(0xffd4d5d9),
                                  tabs: [
                                    Tab(text: "Item"),
                                  ],
                                ),
                                SizedBox(
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
                                            )
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

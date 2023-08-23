// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../ui/widgets/detailed_card.dart';
import '../../../approved_bp/controller/approved_bp_controller.dart';

class DetailedBpScreen extends StatefulWidget {
  final String name;
  final String code;
  const DetailedBpScreen({Key? key, required this.name, required this.code})
      : super(key: key);

  @override
  State<DetailedBpScreen> createState() => _DetailedBpScreenState();
}

class _DetailedBpScreenState extends State<DetailedBpScreen> {
  ApprovedBpController ac = Get.put(ApprovedBpController());
  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ac.getBPDetailsData();
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text('BP Master Details'),
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
                            length: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                TabBar(
                                  labelColor: Colors
                                      .blueAccent, // Color of the selected tab
                                  unselectedLabelColor: Color(0xffd4d5d9),
                                  tabs: [
                                    Tab(text: "General"),
                                    Tab(text: "Contact"),
                                    Tab(text: "Addresses"),
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
                                      ac.GetBPDetailsList.length != 0
                                          ? Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 0,
                                                      horizontal: 20),
                                              child: ListView(
                                                children: [
                                                  DetailsCard(
                                                    title: "Details",
                                                    subtitleData: [
                                                      {
                                                        'subtitle': 'Name',
                                                        'text':
                                                            ac.GetBPDetailsList[0]
                                                                    .CardName ??
                                                                "-"
                                                      },
                                                      {
                                                        'subtitle': 'Code',
                                                        'text':
                                                            ac.GetBPDetailsList[0]
                                                                    .CardCode ??
                                                                "-"
                                                      },
                                                      {
                                                        'subtitle': 'Currency',
                                                        'text':
                                                            ac.GetBPDetailsList[0]
                                                                    .Currency ??
                                                                "-"
                                                      },
                                                      {
                                                        'subtitle':
                                                            'Sale Employee Name',
                                                        'text': ac
                                                                .GetBPDetailsList[
                                                                    0]
                                                                .SalEmpNam ??
                                                            "-"
                                                      },
                                                      {
                                                        'subtitle': 'Telephone',
                                                        'text':
                                                            ac.GetBPDetailsList[0]
                                                                    .Cellular ??
                                                                "-"
                                                      },
                                                      {
                                                        'subtitle': 'Mobile No',
                                                        'text':
                                                            ac.GetBPDetailsList[0]
                                                                    .Phone1 ??
                                                                "-"
                                                      },
                                                      {
                                                        'subtitle': 'Email',
                                                        'text':
                                                            ac.GetBPDetailsList[0]
                                                                    .E_Mail ??
                                                                "-"
                                                      },
                                                      {
                                                        'subtitle': 'Website',
                                                        'text': ac
                                                                .GetBPDetailsList[
                                                                    0]
                                                                .IntrntSite ??
                                                            "-"
                                                      },
                                                    ],
                                                  )
                                                ],
                                              ),
                                            )
                                          : SizedBox(),
                                      // Content for Tab 2
                                      ac.GetBPDetailsList.length != 0
                                          ? Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 0,
                                                      horizontal: 20),
                                              child: ListView(
                                                children: [
                                                  DetailsCard(
                                                    title: "Person",
                                                    subtitleData: [
                                                      {
                                                        'subtitle':
                                                            'First Name',
                                                        'text': ac
                                                                .GetBPDetailsList[
                                                                    0]
                                                                .ContactPersons?[
                                                                    0]
                                                                .FirstName ??
                                                            "-"
                                                      },
                                                      {
                                                        'subtitle':
                                                            'Middle Name',
                                                        'text': ac
                                                                .GetBPDetailsList[
                                                                    0]
                                                                .ContactPersons?[
                                                                    0]
                                                                .MiddleName ??
                                                            "-"
                                                      },
                                                      {
                                                        'subtitle': 'Last Name',
                                                        'text': ac
                                                                .GetBPDetailsList[
                                                                    0]
                                                                .ContactPersons?[
                                                                    0]
                                                                .LastName ??
                                                            "-"
                                                      },
                                                      {
                                                        'subtitle':
                                                            'Designation',
                                                        'text': ac
                                                                .GetBPDetailsList[
                                                                    0]
                                                                .ContactPersons?[
                                                                    0]
                                                                .Designation ??
                                                            "-"
                                                      },
                                                      {
                                                        'subtitle': 'Telephone',
                                                        'text': ac
                                                                .GetBPDetailsList[
                                                                    0]
                                                                .ContactPersons?[
                                                                    0]
                                                                .Tel1 ??
                                                            "-"
                                                      },
                                                      {
                                                        'subtitle': 'Number',
                                                        'text': ac
                                                                .GetBPDetailsList[
                                                                    0]
                                                                .ContactPersons?[
                                                                    0]
                                                                .Tel2 ??
                                                            "-"
                                                      },
                                                      {
                                                        'subtitle': 'Email',
                                                        'text': ac
                                                                .GetBPDetailsList[
                                                                    0]
                                                                .ContactPersons?[
                                                                    0]
                                                                .E_MailL ??
                                                            "-"
                                                      },
                                                      {
                                                        'subtitle': 'Address',
                                                        'text': ac
                                                                .GetBPDetailsList[
                                                                    0]
                                                                .ContactPersons?[
                                                                    0]
                                                                .Address ??
                                                            "-"
                                                      },
                                                      {
                                                        'subtitle': 'Active',
                                                        'text': ac
                                                                .GetBPDetailsList[
                                                                    0]
                                                                .ContactPersons?[
                                                                    0]
                                                                .Active ??
                                                            "-"
                                                      },
                                                    ],
                                                  )
                                                ],
                                              ),
                                            )
                                          : SizedBox(),

                                      // Content for Tab 3
                                      ac.GetBPDetailsList.length != 0
                                          ? Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 0,
                                                      horizontal: 20),
                                              child: ListView(
                                                children: [
                                                  DetailsCard(
                                                    title: "Billing Address",
                                                    subtitleData: [
                                                      {
                                                        'subtitle':
                                                            'Address Type',
                                                        'text': ac
                                                                .GetBPDetailsList[
                                                                    0]
                                                                .CustomerAddress?[
                                                                    0]
                                                                .AdresType ??
                                                            "-"
                                                      },
                                                      {
                                                        'subtitle': 'Building',
                                                        'text': ac
                                                                .GetBPDetailsList[
                                                                    0]
                                                                .CustomerAddress?[
                                                                    0]
                                                                .Building ??
                                                            "-"
                                                      },
                                                      {
                                                        'subtitle': 'Block',
                                                        'text': ac
                                                                .GetBPDetailsList[
                                                                    0]
                                                                .CustomerAddress?[
                                                                    0]
                                                                .Block ??
                                                            "-"
                                                      },
                                                      {
                                                        'subtitle': 'Street',
                                                        'text': ac
                                                                .GetBPDetailsList[
                                                                    0]
                                                                .CustomerAddress?[
                                                                    0]
                                                                .Street ??
                                                            "-"
                                                      },
                                                      {
                                                        'subtitle': 'City',
                                                        'text': ac
                                                                .GetBPDetailsList[
                                                                    0]
                                                                .CustomerAddress?[
                                                                    0]
                                                                .City ??
                                                            "-"
                                                      },
                                                      {
                                                        'subtitle': 'Country',
                                                        'text': ac
                                                                .GetBPDetailsList[
                                                                    0]
                                                                .CustomerAddress?[
                                                                    0]
                                                                .Country ??
                                                            "-"
                                                      },
                                                      {
                                                        'subtitle': 'State',
                                                        'text': ac
                                                                .GetBPDetailsList[
                                                                    0]
                                                                .CustomerAddress?[
                                                                    0]
                                                                .State ??
                                                            "-"
                                                      },
                                                      {
                                                        'subtitle': 'Zip Code',
                                                        'text': ac
                                                                .GetBPDetailsList[
                                                                    0]
                                                                .CustomerAddress?[
                                                                    0]
                                                                .ZipCode ??
                                                            "-"
                                                      },
                                                      {
                                                        'subtitle':
                                                            'Ship to Country',
                                                        'text': ac
                                                                .GetBPDetailsList[
                                                                    0]
                                                                .CustomerAddress?[
                                                                    0]
                                                                .County ??
                                                            "-"
                                                      },
                                                      {
                                                        'subtitle': 'Address',
                                                        'text': ac
                                                                .GetBPDetailsList[
                                                                    0]
                                                                .CustomerAddress?[
                                                                    0]
                                                                .Address ??
                                                            "-"
                                                      },
                                                    ],
                                                  ),
                                                  ac.GetBPDetailsList.length ==
                                                          2
                                                      ? DetailsCard(
                                                          title: "Shipping",
                                                          subtitleData: [
                                                            {
                                                              'subtitle':
                                                                  'Address Type',
                                                              'text': ac
                                                                      .GetBPDetailsList[
                                                                          0]
                                                                      .CustomerAddress?[
                                                                          1]
                                                                      .AdresType ??
                                                                  "-"
                                                            },
                                                            {
                                                              'subtitle':
                                                                  'Building',
                                                              'text': ac
                                                                      .GetBPDetailsList[
                                                                          0]
                                                                      .CustomerAddress?[
                                                                          1]
                                                                      .Building ??
                                                                  "-"
                                                            },
                                                            {
                                                              'subtitle':
                                                                  'Block',
                                                              'text': ac
                                                                      .GetBPDetailsList[
                                                                          0]
                                                                      .CustomerAddress?[
                                                                          1]
                                                                      .Block ??
                                                                  "-"
                                                            },
                                                            {
                                                              'subtitle':
                                                                  'Street',
                                                              'text': ac
                                                                      .GetBPDetailsList[
                                                                          0]
                                                                      .CustomerAddress?[
                                                                          1]
                                                                      .Street ??
                                                                  "-"
                                                            },
                                                            {
                                                              'subtitle':
                                                                  'City',
                                                              'text': ac
                                                                      .GetBPDetailsList[
                                                                          0]
                                                                      .CustomerAddress?[
                                                                          1]
                                                                      .City ??
                                                                  "-"
                                                            },
                                                            {
                                                              'subtitle':
                                                                  'Country',
                                                              'text': ac
                                                                      .GetBPDetailsList[
                                                                          0]
                                                                      .CustomerAddress?[
                                                                          1]
                                                                      .Country ??
                                                                  "-"
                                                            },
                                                            {
                                                              'subtitle':
                                                                  'State',
                                                              'text': ac
                                                                      .GetBPDetailsList[
                                                                          0]
                                                                      .CustomerAddress?[
                                                                          1]
                                                                      .State ??
                                                                  "-"
                                                            },
                                                            {
                                                              'subtitle':
                                                                  'Zip Code',
                                                              'text': ac
                                                                      .GetBPDetailsList[
                                                                          0]
                                                                      .CustomerAddress?[
                                                                          1]
                                                                      .ZipCode ??
                                                                  "-"
                                                            },
                                                            {
                                                              'subtitle':
                                                                  'Ship to Country',
                                                              'text': ac
                                                                      .GetBPDetailsList[
                                                                          0]
                                                                      .CustomerAddress?[
                                                                          1]
                                                                      .County ??
                                                                  "-"
                                                            },
                                                            {
                                                              'subtitle':
                                                                  'Address',
                                                              'text': ac
                                                                      .GetBPDetailsList[
                                                                          0]
                                                                      .CustomerAddress?[
                                                                          1]
                                                                      .Address ??
                                                                  "-"
                                                            },
                                                          ],
                                                        )
                                                      : SizedBox()
                                                ],
                                              ),
                                            )
                                          : SizedBox()
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

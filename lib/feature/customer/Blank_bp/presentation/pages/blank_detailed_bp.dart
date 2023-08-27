// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app/feature/customer/rejected_bp/controller/rejected_bp_controller.dart';
import 'package:new_app/feature/customer/unapproved_bp/controller/unapproved_bp_controller.dart';

import '../../../../../ui/Buttons/buttonBS.dart';
import '../../../../../ui/widgets/detailed_card.dart';
import '../../../approved_bp/controller/approved_bp_controller.dart';
import '../../controller/blank_bp_controller.dart';

class DetailedBlankScreen extends StatefulWidget {
  final String name;
  final String code;
  const DetailedBlankScreen({required this.name, required this.code, Key? key})
      : super(key: key);

  @override
  State<DetailedBlankScreen> createState() => _DetailedBlankScreenState();
}

class _DetailedBlankScreenState extends State<DetailedBlankScreen> {
  BlankCustomerController ac = Get.put(BlankCustomerController());
  UnApprovedBpController uc = Get.put(UnApprovedBpController());
  RejectedCustomerController rc = Get.put(RejectedCustomerController());

  @override
  void dispose() {
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
          title: Text('Blank Details'),
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
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              widget.name,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            widget.code,
                            style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.w400,
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
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Obx(
                                                        () => ButtonBS(
                                                          title: ac.load1
                                                                      .value ==
                                                                  true
                                                              ? CircularProgressIndicator(
                                                                  strokeWidth:
                                                                      1,
                                                                  color: Colors
                                                                      .white,
                                                                )
                                                              : Text(
                                                                  'Un-Approve',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white),
                                                                ),
                                                          backgroundColor:
                                                              const Color
                                                                      .fromARGB(
                                                                  255,
                                                                  33,
                                                                  79,
                                                                  243),
                                                          textColor:
                                                              Colors.white,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          paddingAll: 16,
                                                          borderRadius: 10,
                                                          fontSize: 16,
                                                          onPressed: () async {
                                                            ac.load1.value =
                                                                true;
                                                            var res = await ac
                                                                .updateBPDetailsData(
                                                                    widget.code,
                                                                    "Un-Approved");
                                                            ac.load1.value =
                                                                false;

                                                            if (ac.res.value ==
                                                                "Success") {
                                                              await ac
                                                                  .getBlankCustomerData();
                                                              await uc
                                                                  .getUn_ApprovedCustomerData();
                                                              ac.filterData('');
                                                              uc.filterData_UN(
                                                                  '');
                                                              ScaffoldMessenger
                                                                      .of(
                                                                          context)
                                                                  .showSnackBar(
                                                                      SnackBar(
                                                                          content:
                                                                              Text('Successfully Un-Approved')));
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            } else {
                                                              ScaffoldMessenger
                                                                      .of(
                                                                          context)
                                                                  .showSnackBar(
                                                                      SnackBar(
                                                                          content:
                                                                              Text('An error has occurred')));
                                                            }
                                                          },
                                                        ),
                                                      ),
                                                      Obx(
                                                        () => ButtonBS(
                                                          title: ac.load2
                                                                      .value ==
                                                                  true
                                                              ? CircularProgressIndicator(
                                                                  strokeWidth:
                                                                      1,
                                                                  color: Colors
                                                                      .black,
                                                                )
                                                              : Text('Reject'),
                                                          backgroundColor:
                                                              const Color
                                                                      .fromARGB(
                                                                  255,
                                                                  228,
                                                                  228,
                                                                  228),
                                                          textColor: const Color
                                                                  .fromARGB(
                                                              255, 33, 79, 243),
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          paddingAll: 16,
                                                          borderRadius: 10,
                                                          fontSize: 16,
                                                          onPressed: () async {
                                                            ac.load2.value =
                                                                true;
                                                            var res = await ac
                                                                .updateBPDetailsData(
                                                                    widget.code,
                                                                    "Rejected");
                                                            ac.load2.value =
                                                                false;
                                                            if (ac.res.value ==
                                                                "Success") {
                                                              await ac
                                                                  .getBlankCustomerData();
                                                              await rc
                                                                  .getRejectedCustomerData();
                                                              ac.filterData('');
                                                              rc.filterData('');
                                                              ScaffoldMessenger
                                                                      .of(
                                                                          context)
                                                                  .showSnackBar(
                                                                      SnackBar(
                                                                          content:
                                                                              Text('Successfully Approved')));
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            } else {
                                                              ScaffoldMessenger
                                                                      .of(
                                                                          context)
                                                                  .showSnackBar(
                                                                      SnackBar(
                                                                          content:
                                                                              Text('An error has occurred')));
                                                            }
                                                          },
                                                        ),
                                                      )
                                                    ],
                                                  ),
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
                                              child:
                                                  ac
                                                              .GetBPDetailsList[
                                                                  0]
                                                              .CustomerAddress
                                                              ?.length ==
                                                          0
                                                      ? SizedBox()
                                                      : ListView(
                                                          children: [
                                                            DetailsCard(
                                                              title:
                                                                  "Billing Address",
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
                                                                  'subtitle':
                                                                      'Building',
                                                                  'text': ac
                                                                          .GetBPDetailsList[
                                                                              0]
                                                                          .CustomerAddress?[
                                                                              0]
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
                                                                              0]
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
                                                                              0]
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
                                                                              0]
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
                                                                              0]
                                                                          .CountryNm ??
                                                                      "-"
                                                                },
                                                                {
                                                                  'subtitle':
                                                                      'State',
                                                                  'text': ac
                                                                          .GetBPDetailsList[
                                                                              0]
                                                                          .CustomerAddress?[
                                                                              0]
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
                                                                              0]
                                                                          .ZipCode ??
                                                                      "-"
                                                                },
                                                                {
                                                                  'subtitle':
                                                                      'Ship to County',
                                                                  'text': ac
                                                                          .GetBPDetailsList[
                                                                              0]
                                                                          .CustomerAddress?[
                                                                              0]
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
                                                                              0]
                                                                          .Address ??
                                                                      "-"
                                                                },
                                                              ],
                                                            ),
                                                            ac.GetBPDetailsList[0]
                                                                        .CustomerAddress?[1] !=
                                                                    null
                                                                ? DetailsCard(
                                                                    title:
                                                                        "Shipping Address",
                                                                    subtitleData: [
                                                                      {
                                                                        'subtitle':
                                                                            'Address Type',
                                                                        'text':
                                                                            ac.GetBPDetailsList[0].CustomerAddress?[1].AdresType ??
                                                                                "-"
                                                                      },
                                                                      {
                                                                        'subtitle':
                                                                            'Building',
                                                                        'text':
                                                                            ac.GetBPDetailsList[0].CustomerAddress?[1].Building ??
                                                                                "-"
                                                                      },
                                                                      {
                                                                        'subtitle':
                                                                            'Block',
                                                                        'text':
                                                                            ac.GetBPDetailsList[0].CustomerAddress?[1].Block ??
                                                                                "-"
                                                                      },
                                                                      {
                                                                        'subtitle':
                                                                            'Street',
                                                                        'text':
                                                                            ac.GetBPDetailsList[0].CustomerAddress?[1].Street ??
                                                                                "-"
                                                                      },
                                                                      {
                                                                        'subtitle':
                                                                            'City',
                                                                        'text':
                                                                            ac.GetBPDetailsList[0].CustomerAddress?[1].City ??
                                                                                "-"
                                                                      },
                                                                      {
                                                                        'subtitle':
                                                                            'Country',
                                                                        'text':
                                                                            ac.GetBPDetailsList[0].CustomerAddress?[1].Country ??
                                                                                "-"
                                                                      },
                                                                      {
                                                                        'subtitle':
                                                                            'State',
                                                                        'text':
                                                                            ac.GetBPDetailsList[0].CustomerAddress?[1].State ??
                                                                                "-"
                                                                      },
                                                                      {
                                                                        'subtitle':
                                                                            'Zip Code',
                                                                        'text':
                                                                            ac.GetBPDetailsList[0].CustomerAddress?[1].ZipCode ??
                                                                                "-"
                                                                      },
                                                                      {
                                                                        'subtitle':
                                                                            'Ship to County',
                                                                        'text':
                                                                            ac.GetBPDetailsList[0].CustomerAddress?[1].County ??
                                                                                "-"
                                                                      },
                                                                      {
                                                                        'subtitle':
                                                                            'Address',
                                                                        'text':
                                                                            ac.GetBPDetailsList[0].CustomerAddress?[1].Address ??
                                                                                "-"
                                                                      },
                                                                    ],
                                                                  )
                                                                : SizedBox()
                                                          ],
                                                        ),
                                            )
                                          : SizedBox(),
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

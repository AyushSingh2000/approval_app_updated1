// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:new_app/ui/colors/app_colors.dart';

import '../../../../../ui/Buttons/buttonBS.dart';
import '../../../../../ui/widgets/detailed_card.dart';
import '../../../approved_bp/controller/approved_bp_controller.dart';
import '../../controller/unapproved_bp_controller.dart';

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
  UnApprovedBpController uac = Get.put(UnApprovedBpController());
  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    uac.getBPDetailsData();
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.appbarmainblue,
          elevation: 0,
          title: const Text('Customer Details'),
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
              child: Obx(() => uac.detailsDataLoading.value == true
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
                            length: 3,
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
                                      .appbarmainblue, // // Color of the selected tab
                                  unselectedLabelColor: Color(0xffd4d5d9),
                                  tabs: [
                                    Tab(text: "General"),
                                    Tab(text: "Contact"),
                                    Tab(text: "Addresses"),
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
                                      uac.GetBPDetailsList.length != 0
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
                                                        'text': uac
                                                                .GetBPDetailsList[
                                                                    0]
                                                                .CardName ??
                                                            "-"
                                                      },
                                                      {
                                                        'subtitle': 'Code',
                                                        'text': uac
                                                                .GetBPDetailsList[
                                                                    0]
                                                                .CardCode ??
                                                            "-"
                                                      },
                                                      {
                                                        'subtitle': 'Currency',
                                                        'text': uac
                                                                .GetBPDetailsList[
                                                                    0]
                                                                .Currency ??
                                                            "-"
                                                      },
                                                      {
                                                        'subtitle':
                                                            'Sale Employee Name',
                                                        'text': uac
                                                                .GetBPDetailsList[
                                                                    0]
                                                                .SalEmpNam ??
                                                            "-"
                                                      },
                                                      {
                                                        'subtitle': 'Telephone',
                                                        'text': uac
                                                                .GetBPDetailsList[
                                                                    0]
                                                                .Cellular ??
                                                            "-"
                                                      },
                                                      {
                                                        'subtitle': 'Mobile No',
                                                        'text': uac
                                                                .GetBPDetailsList[
                                                                    0]
                                                                .Phone1 ??
                                                            "-"
                                                      },
                                                      {
                                                        'subtitle': 'Email',
                                                        'text': uac
                                                                .GetBPDetailsList[
                                                                    0]
                                                                .E_Mail ??
                                                            "-"
                                                      },
                                                      {
                                                        'subtitle': 'Website',
                                                        'text': uac
                                                                .GetBPDetailsList[
                                                                    0]
                                                                .IntrntSite ??
                                                            "-"
                                                      },
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 20,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Obx(
                                                        () => SizedBox(
                                                          height: 50,
                                                          width: width * 0.33,
                                                          child: ElevatedButton(
                                                            style: ButtonStyle(
                                                              backgroundColor:
                                                                  MaterialStateProperty
                                                                      .all<
                                                                          Color>(
                                                                AppColors
                                                                    .mainblue,
                                                              ),
                                                              shape: MaterialStateProperty
                                                                  .all<
                                                                      RoundedRectangleBorder>(
                                                                RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12),
                                                                  // side: const BorderSide(color: Colors.red),
                                                                ),
                                                              ),
                                                            ),
                                                            // backgroundColor:
                                                            //     const Color
                                                            //         .fromARGB(255,
                                                            //         33, 79, 243),
                                                            // textColor:
                                                            //     Colors.white,
                                                            // fontWeight:
                                                            //     FontWeight.w500,
                                                            // paddingAll: 16,
                                                            // borderRadius: 10,
                                                            // fontSize: 16,
                                                            onPressed:
                                                                () async {
                                                              uac.load.value =
                                                                  true;
                                                              var res = await uac
                                                                  .updateBPDetailsData(
                                                                      widget
                                                                          .code,
                                                                      "Approved");
                                                              uac.load.value =
                                                                  false;
                                                              if (uac.res
                                                                      .value ==
                                                                  "Success") {
                                                                print(
                                                                    '!!!!!!!!Approved');
                                                                await uac
                                                                    .getUn_ApprovedCustomerData();
                                                                uac.filterData_UN(
                                                                    '');
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(const SnackBar(
                                                                        content:
                                                                            Text('Approval Successfull')));

                                                                await ac
                                                                    .getApprovedCustomerData();

                                                                uac.GetBPUN_ApprovalStatusList
                                                                    .refresh();
                                                                uac.filteredData_unApproved
                                                                    .refresh();
                                                                ac.GetBPApprovalStatusList
                                                                    .refresh();
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                              } else {
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(const SnackBar(
                                                                        content:
                                                                            Text('Approval Un-Successfull')));
                                                              }
                                                            },
                                                            child: uac.load.value ==
                                                                    true
                                                                ? Container(
                                                                    height: 25,
                                                                    width: 25,
                                                                    child: const CircularProgressIndicator(
                                                                        strokeWidth:
                                                                            1,
                                                                        color: Colors
                                                                            .white))
                                                                : const Text(
                                                                    'Approve',
                                                                    style:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                  ),
                                                          ),
                                                        ),
                                                      ),
                                                      Obx(
                                                        () => SizedBox(
                                                          height: 50,
                                                          width: width * 0.33,
                                                          child: ElevatedButton(
                                                            style: ButtonStyle(
                                                              backgroundColor:
                                                                  MaterialStateProperty
                                                                      .all<
                                                                          Color>(
                                                                AppColors
                                                                    .appgrey,
                                                              ),
                                                              shape: MaterialStateProperty
                                                                  .all<
                                                                      RoundedRectangleBorder>(
                                                                RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12),
                                                                  // side: const BorderSide(color: Colors.red),
                                                                ),
                                                              ),
                                                            ),
                                                            // backgroundColor:
                                                            //     const Color
                                                            //         .fromARGB(
                                                            //         255,
                                                            //         228,
                                                            //         228,
                                                            //         228),
                                                            // textColor: const Color
                                                            //     .fromARGB(
                                                            //     255, 33, 79, 243),
                                                            // fontWeight:
                                                            //     FontWeight.w500,
                                                            // paddingAll: 16,
                                                            // borderRadius: 10,
                                                            // fontSize: 16,
                                                            onPressed:
                                                                () async {
                                                              uac.load_rejected
                                                                  .value = true;

                                                              var res = await uac
                                                                  .updateBPDetailsData(
                                                                      widget
                                                                          .code,
                                                                      "Rejected");
                                                              uac.load_rejected
                                                                      .value =
                                                                  false;
                                                              if (uac.res
                                                                      .value ==
                                                                  "Success") {
                                                                print(
                                                                    '!!!!!!!!Rejected');
                                                                await uac
                                                                    .getUn_ApprovedCustomerData();
                                                                uac.filterData_UN(
                                                                    '');
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(const SnackBar(
                                                                        content:
                                                                            Text('Rejected Successfully')));

                                                                await ac
                                                                    .getApprovedCustomerData();

                                                                uac.GetBPUN_ApprovalStatusList
                                                                    .refresh();
                                                                uac.filteredData_unApproved
                                                                    .refresh();
                                                                ac.GetBPApprovalStatusList
                                                                    .refresh();
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                              } else {
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(const SnackBar(
                                                                        content:
                                                                            Text('Un-Successfull')));
                                                              }
                                                            },
                                                            child: uac.load_rejected
                                                                        .value ==
                                                                    true
                                                                ? Container(
                                                                    height: 25,
                                                                    width: 25,
                                                                    child:
                                                                        const CircularProgressIndicator(
                                                                      strokeWidth:
                                                                          1,
                                                                      color: Color.fromARGB(
                                                                          255,
                                                                          33,
                                                                          79,
                                                                          243),
                                                                    ))
                                                                : const Text(
                                                                    'Reject',
                                                                    style:
                                                                        TextStyle(
                                                                      color: AppColors
                                                                          .gradientColor1,
                                                                    ),
                                                                  ),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            )
                                          : const SizedBox(),
                                      // Content for Tab 2
                                      uac.GetBPDetailsList.length != 0
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
                                                        'text': uac
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
                                                        'text': uac
                                                                .GetBPDetailsList[
                                                                    0]
                                                                .ContactPersons?[
                                                                    0]
                                                                .MiddleName ??
                                                            "-"
                                                      },
                                                      {
                                                        'subtitle': 'Last Name',
                                                        'text': uac
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
                                                        'text': uac
                                                                .GetBPDetailsList[
                                                                    0]
                                                                .ContactPersons?[
                                                                    0]
                                                                .Designation ??
                                                            "-"
                                                      },
                                                      {
                                                        'subtitle': 'Telephone',
                                                        'text': uac
                                                                .GetBPDetailsList[
                                                                    0]
                                                                .ContactPersons?[
                                                                    0]
                                                                .Tel1 ??
                                                            "-"
                                                      },
                                                      {
                                                        'subtitle': 'Number',
                                                        'text': uac
                                                                .GetBPDetailsList[
                                                                    0]
                                                                .ContactPersons?[
                                                                    0]
                                                                .Tel2 ??
                                                            "-"
                                                      },
                                                      {
                                                        'subtitle': 'Email',
                                                        'text': uac
                                                                .GetBPDetailsList[
                                                                    0]
                                                                .ContactPersons?[
                                                                    0]
                                                                .E_MailL ??
                                                            "-"
                                                      },
                                                      {
                                                        'subtitle': 'Address',
                                                        'text': uac
                                                                .GetBPDetailsList[
                                                                    0]
                                                                .ContactPersons?[
                                                                    0]
                                                                .Address ??
                                                            "-"
                                                      },
                                                      {
                                                        'subtitle': 'Active',
                                                        'text': uac
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
                                          : const SizedBox(),

                                      // Content for Tab 3
                                      uac.GetBPDetailsList.length != 0
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
                                                        'text': uac
                                                                .GetBPDetailsList[
                                                                    0]
                                                                .CustomerAddress?[
                                                                    0]
                                                                .AdresType ??
                                                            "-"
                                                      },
                                                      {
                                                        'subtitle': 'Building',
                                                        'text': uac
                                                                .GetBPDetailsList[
                                                                    0]
                                                                .CustomerAddress?[
                                                                    0]
                                                                .Building ??
                                                            "-"
                                                      },
                                                      {
                                                        'subtitle': 'Block',
                                                        'text': uac
                                                                .GetBPDetailsList[
                                                                    0]
                                                                .CustomerAddress?[
                                                                    0]
                                                                .Block ??
                                                            "-"
                                                      },
                                                      {
                                                        'subtitle': 'Street',
                                                        'text': uac
                                                                .GetBPDetailsList[
                                                                    0]
                                                                .CustomerAddress?[
                                                                    0]
                                                                .Street ??
                                                            "-"
                                                      },
                                                      {
                                                        'subtitle': 'City',
                                                        'text': uac
                                                                .GetBPDetailsList[
                                                                    0]
                                                                .CustomerAddress?[
                                                                    0]
                                                                .City ??
                                                            "-"
                                                      },
                                                      {
                                                        'subtitle': 'Country',
                                                        'text': uac
                                                                .GetBPDetailsList[
                                                                    0]
                                                                .CustomerAddress?[
                                                                    0]
                                                                .Country ??
                                                            "-"
                                                      },
                                                      {
                                                        'subtitle': 'State',
                                                        'text': uac
                                                                .GetBPDetailsList[
                                                                    0]
                                                                .CustomerAddress?[
                                                                    0]
                                                                .State ??
                                                            "-"
                                                      },
                                                      {
                                                        'subtitle': 'Zip Code',
                                                        'text': uac
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
                                                        'text': uac
                                                                .GetBPDetailsList[
                                                                    0]
                                                                .CustomerAddress?[
                                                                    0]
                                                                .County ??
                                                            "-"
                                                      },
                                                      {
                                                        'subtitle': 'Address',
                                                        'text': uac
                                                                .GetBPDetailsList[
                                                                    0]
                                                                .CustomerAddress?[
                                                                    0]
                                                                .Address ??
                                                            "-"
                                                      },
                                                    ],
                                                  ),
                                                  uac.GetBPDetailsList.length ==
                                                          2
                                                      ? DetailsCard(
                                                          title: "Shipping",
                                                          subtitleData: [
                                                            {
                                                              'subtitle':
                                                                  'Address Type',
                                                              'text': uac
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
                                                              'text': uac
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
                                                              'text': uac
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
                                                              'text': uac
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
                                                              'text': uac
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
                                                              'text': uac
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
                                                              'text': uac
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
                                                              'text': uac
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
                                                              'text': uac
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
                                                              'text': uac
                                                                      .GetBPDetailsList[
                                                                          0]
                                                                      .CustomerAddress?[
                                                                          1]
                                                                      .Address ??
                                                                  "-"
                                                            },
                                                          ],
                                                        )
                                                      : const SizedBox()
                                                ],
                                              ),
                                            )
                                          : const SizedBox()
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

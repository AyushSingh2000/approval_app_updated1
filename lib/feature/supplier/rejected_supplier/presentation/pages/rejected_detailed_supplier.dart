// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app/ui/colors/app_colors.dart';

import '../../../../../ui/widgets/detailed_card.dart';
import '../../../approved_supplier/controller/Approved_supplier_controller.dart';
import '../../../unapproved_supplier/controller/unapproved_supplier_controller.dart';
import '../../controller/rejected_supplier_controller.dart';

class DetailedRejectedScreen extends StatefulWidget {
  final String name;
  final String code;
  const DetailedRejectedScreen(
      {required this.name, required this.code, Key? key})
      : super(key: key);

  @override
  State<DetailedRejectedScreen> createState() => _DetailedRejectedScreenState();
}

class _DetailedRejectedScreenState extends State<DetailedRejectedScreen> {
  RejectedSupplierController ac = Get.put(RejectedSupplierController());
  ApprovedSupplierController apc = Get.put(ApprovedSupplierController());
  UnApprovedSupplierController uc = Get.put(UnApprovedSupplierController());

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ac.getSupplierDetailsData();
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.appbarmainblue,
          elevation: 0,
          title: const Text('Blank Details'),
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
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              widget.name,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            widget.code,
                            style: const TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.w400,
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
                                      .appbarmainblue, //  // Color of the selected tab
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
                                      ac.GetSupplierDetailsList.length != 0
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
                                                            ac.GetSupplierDetailsList[0]
                                                                    .CardName ??
                                                                "-"
                                                      },
                                                      {
                                                        'subtitle': 'Code',
                                                        'text':
                                                            ac.GetSupplierDetailsList[0]
                                                                    .CardCode ??
                                                                "-"
                                                      },
                                                      {
                                                        'subtitle': 'Currency',
                                                        'text':
                                                            ac.GetSupplierDetailsList[0]
                                                                    .Currency ??
                                                                "-"
                                                      },
                                                      {
                                                        'subtitle':
                                                            'Sale Employee Name',
                                                        'text': ac
                                                                .GetSupplierDetailsList[
                                                                    0]
                                                                .SalEmpNam ??
                                                            "-"
                                                      },
                                                      {
                                                        'subtitle': 'Telephone',
                                                        'text':
                                                            ac.GetSupplierDetailsList[0]
                                                                    .Cellular ??
                                                                "-"
                                                      },
                                                      {
                                                        'subtitle': 'Mobile No',
                                                        'text':
                                                            ac.GetSupplierDetailsList[0]
                                                                    .Phone1 ??
                                                                "-"
                                                      },
                                                      {
                                                        'subtitle': 'Email',
                                                        'text':
                                                            ac.GetSupplierDetailsList[0]
                                                                    .E_Mail ??
                                                                "-"
                                                      },
                                                      {
                                                        'subtitle': 'Website',
                                                        'text': ac
                                                                .GetSupplierDetailsList[
                                                                    0]
                                                                .IntrntSite ??
                                                            "-"
                                                      },
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 20,
                                                  ),
                                                  // Row(
                                                  //   mainAxisAlignment:
                                                  //       MainAxisAlignment
                                                  //           .spaceEvenly,
                                                  //   children: [
                                                  //     Obx(
                                                  //       () => ButtonBS(
                                                  //         title: ac.load1
                                                  //                     .value ==
                                                  //                 true
                                                  //             ? const CircularProgressIndicator(
                                                  //                 strokeWidth:
                                                  //                     1,
                                                  //                 color: Colors
                                                  //                     .white,
                                                  //               )
                                                  //             : const Text(
                                                  //                 'Approve',
                                                  //                 style: TextStyle(
                                                  //                     color: Colors
                                                  //                         .white),
                                                  //               ),
                                                  //         backgroundColor:
                                                  //             const Color
                                                  //                 .fromARGB(255,
                                                  //                 33, 79, 243),
                                                  //         textColor:
                                                  //             Colors.white,
                                                  //         fontWeight:
                                                  //             FontWeight.w500,
                                                  //         paddingAll: 16,
                                                  //         borderRadius: 10,
                                                  //         fontSize: 16,
                                                  //         onPressed: () async {
                                                  //           ac.load1.value =
                                                  //               true;
                                                  //           var res = await ac
                                                  //               .updateSupplierDetailsData(
                                                  //                   widget.code,
                                                  //                   "Approved");
                                                  //           ac.load1.value =
                                                  //               false;

                                                  //           if (ac.res.value ==
                                                  //               'Success') {
                                                  //             await ac
                                                  //                 .getRejectedSupplierData();
                                                  //             await apc
                                                  //                 .getApprovedSupplierData();
                                                  //             ac.filterData('');
                                                  //             apc.filterData(
                                                  //                 '');
                                                  //             ScaffoldMessenger
                                                  //                     .of(
                                                  //                         context)
                                                  //                 .showSnackBar(
                                                  //                     const SnackBar(
                                                  //                         content:
                                                  //                             Text('Successfully Approved')));
                                                  //             Navigator.of(
                                                  //                     context)
                                                  //                 .pop();
                                                  //           } else {
                                                  //             ScaffoldMessenger
                                                  //                     .of(
                                                  //                         context)
                                                  //                 .showSnackBar(
                                                  //                     const SnackBar(
                                                  //                         content:
                                                  //                             Text('An Error has occurred')));
                                                  //           }
                                                  //         },
                                                  //       ),
                                                  //     ),
                                                  //     Obx(
                                                  //       () => ButtonBS(
                                                  //         title: ac.load2
                                                  //                     .value ==
                                                  //                 true
                                                  //             ? const CircularProgressIndicator(
                                                  //                 strokeWidth:
                                                  //                     1,
                                                  //                 color: Colors
                                                  //                     .black,
                                                  //               )
                                                  //             : const Text(
                                                  //                 'Un-Approve'),
                                                  //         backgroundColor:
                                                  //             const Color
                                                  //                 .fromARGB(
                                                  //                 255,
                                                  //                 228,
                                                  //                 228,
                                                  //                 228),
                                                  //         textColor: const Color
                                                  //             .fromARGB(
                                                  //             255, 33, 79, 243),
                                                  //         fontWeight:
                                                  //             FontWeight.w500,
                                                  //         paddingAll: 16,
                                                  //         borderRadius: 10,
                                                  //         fontSize: 16,
                                                  //         onPressed: () async {
                                                  //           ac.load2.value =
                                                  //               true;
                                                  //           var res = await ac
                                                  //               .updateSupplierDetailsData(
                                                  //                   widget.code,
                                                  //                   "Un-Approved");
                                                  //           ac.load2.value =
                                                  //               false;
                                                  //           if (ac.res.value ==
                                                  //               "Success") {
                                                  //             await ac
                                                  //                 .getRejectedSupplierData();
                                                  //             await uc
                                                  //                 .getUnApprovedSupplierData();
                                                  //             ac.filterData('');
                                                  //             uc.filterData('');
                                                  //             ScaffoldMessenger
                                                  //                     .of(
                                                  //                         context)
                                                  //                 .showSnackBar(
                                                  //                     const SnackBar(
                                                  //                         content:
                                                  //                             Text('Successfully Un-Approved')));
                                                  //             Navigator.of(
                                                  //                     context)
                                                  //                 .pop();
                                                  //           } else {
                                                  //             ScaffoldMessenger
                                                  //                     .of(
                                                  //                         context)
                                                  //                 .showSnackBar(
                                                  //                     const SnackBar(
                                                  //                         content:
                                                  //                             Text('An Error has occurred')));
                                                  //           }
                                                  //         },
                                                  //       ),
                                                  //     ),
                                                  //   ],
                                                  // ),
                                                ],
                                              ),
                                            )
                                          : const SizedBox(),
                                      // Content for Tab 2
                                      ac.GetSupplierDetailsList.length != 0
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
                                                                .GetSupplierDetailsList[
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
                                                                .GetSupplierDetailsList[
                                                                    0]
                                                                .ContactPersons?[
                                                                    0]
                                                                .MiddleName ??
                                                            "-"
                                                      },
                                                      {
                                                        'subtitle': 'Last Name',
                                                        'text': ac
                                                                .GetSupplierDetailsList[
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
                                                                .GetSupplierDetailsList[
                                                                    0]
                                                                .ContactPersons?[
                                                                    0]
                                                                .Designation ??
                                                            "-"
                                                      },
                                                      {
                                                        'subtitle': 'Telephone',
                                                        'text': ac
                                                                .GetSupplierDetailsList[
                                                                    0]
                                                                .ContactPersons?[
                                                                    0]
                                                                .Tel1 ??
                                                            "-"
                                                      },
                                                      {
                                                        'subtitle': 'Number',
                                                        'text': ac
                                                                .GetSupplierDetailsList[
                                                                    0]
                                                                .ContactPersons?[
                                                                    0]
                                                                .Tel2 ??
                                                            "-"
                                                      },
                                                      {
                                                        'subtitle': 'Email',
                                                        'text': ac
                                                                .GetSupplierDetailsList[
                                                                    0]
                                                                .ContactPersons?[
                                                                    0]
                                                                .E_MailL ??
                                                            "-"
                                                      },
                                                      {
                                                        'subtitle': 'Address',
                                                        'text': ac
                                                                .GetSupplierDetailsList[
                                                                    0]
                                                                .ContactPersons?[
                                                                    0]
                                                                .Address ??
                                                            "-"
                                                      },
                                                      {
                                                        'subtitle': 'Active',
                                                        'text': ac
                                                                .GetSupplierDetailsList[
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
                                      ac.GetSupplierDetailsList.length != 0
                                          ? Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 0,
                                                      horizontal: 20),
                                              child: ac
                                                          .GetSupplierDetailsList[
                                                              0]
                                                          .CustomerAddress
                                                          ?.length ==
                                                      0
                                                  ? const SizedBox()
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
                                                                      .GetSupplierDetailsList[
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
                                                                      .GetSupplierDetailsList[
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
                                                                      .GetSupplierDetailsList[
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
                                                                      .GetSupplierDetailsList[
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
                                                                      .GetSupplierDetailsList[
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
                                                                      .GetSupplierDetailsList[
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
                                                                      .GetSupplierDetailsList[
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
                                                                      .GetSupplierDetailsList[
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
                                                                      .GetSupplierDetailsList[
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
                                                                      .GetSupplierDetailsList[
                                                                          0]
                                                                      .CustomerAddress?[
                                                                          0]
                                                                      .Address ??
                                                                  "-"
                                                            },
                                                          ],
                                                        ),
                                                        ac.GetSupplierDetailsList[0]
                                                                    .CustomerAddress?[1] !=
                                                                null
                                                            ? DetailsCard(
                                                                title:
                                                                    "Shipping Address",
                                                                subtitleData: [
                                                                  {
                                                                    'subtitle':
                                                                        'Address Type',
                                                                    'text': ac
                                                                            .GetSupplierDetailsList[0]
                                                                            .CustomerAddress?[1]
                                                                            .AdresType ??
                                                                        "-"
                                                                  },
                                                                  {
                                                                    'subtitle':
                                                                        'Building',
                                                                    'text': ac
                                                                            .GetSupplierDetailsList[0]
                                                                            .CustomerAddress?[1]
                                                                            .Building ??
                                                                        "-"
                                                                  },
                                                                  {
                                                                    'subtitle':
                                                                        'Block',
                                                                    'text': ac
                                                                            .GetSupplierDetailsList[0]
                                                                            .CustomerAddress?[1]
                                                                            .Block ??
                                                                        "-"
                                                                  },
                                                                  {
                                                                    'subtitle':
                                                                        'Street',
                                                                    'text': ac
                                                                            .GetSupplierDetailsList[0]
                                                                            .CustomerAddress?[1]
                                                                            .Street ??
                                                                        "-"
                                                                  },
                                                                  {
                                                                    'subtitle':
                                                                        'City',
                                                                    'text': ac
                                                                            .GetSupplierDetailsList[0]
                                                                            .CustomerAddress?[1]
                                                                            .City ??
                                                                        "-"
                                                                  },
                                                                  {
                                                                    'subtitle':
                                                                        'Country',
                                                                    'text': ac
                                                                            .GetSupplierDetailsList[0]
                                                                            .CustomerAddress?[1]
                                                                            .Country ??
                                                                        "-"
                                                                  },
                                                                  {
                                                                    'subtitle':
                                                                        'State',
                                                                    'text': ac
                                                                            .GetSupplierDetailsList[0]
                                                                            .CustomerAddress?[1]
                                                                            .State ??
                                                                        "-"
                                                                  },
                                                                  {
                                                                    'subtitle':
                                                                        'Zip Code',
                                                                    'text': ac
                                                                            .GetSupplierDetailsList[0]
                                                                            .CustomerAddress?[1]
                                                                            .ZipCode ??
                                                                        "-"
                                                                  },
                                                                  {
                                                                    'subtitle':
                                                                        'Ship to County',
                                                                    'text': ac
                                                                            .GetSupplierDetailsList[0]
                                                                            .CustomerAddress?[1]
                                                                            .County ??
                                                                        "-"
                                                                  },
                                                                  {
                                                                    'subtitle':
                                                                        'Address',
                                                                    'text': ac
                                                                            .GetSupplierDetailsList[0]
                                                                            .CustomerAddress?[1]
                                                                            .Address ??
                                                                        "-"
                                                                  },
                                                                ],
                                                              )
                                                            : const SizedBox()
                                                      ],
                                                    ),
                                            )
                                          : const SizedBox(),
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

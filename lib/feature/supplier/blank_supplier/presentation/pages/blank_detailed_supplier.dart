// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../ui/Buttons/buttonBS.dart';
import '../../../../../ui/widgets/detailed_card.dart';
import '../../controller/blank_supplier_controller.dart';

class DetailedSupplierBlankScreen extends StatefulWidget {
  final String name;
  final String code;
  const DetailedSupplierBlankScreen(
      {required this.name, required this.code, Key? key})
      : super(key: key);

  @override
  State<DetailedSupplierBlankScreen> createState() =>
      _DetailedSupplierBlankScreenState();
}

class _DetailedSupplierBlankScreenState
    extends State<DetailedSupplierBlankScreen> {
  BlankSupplierController ac = Get.put(BlankSupplierController());

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ac.getSupplierDetailsData();
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    // print('22222222${ac.GetSupplierDetailsList[0].CustomerAddress}');
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
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      ButtonBS(
                                                        // prefixIcon: CupertinoIcons.cube_box,
                                                        // prefixIconColor: Colors.white,
                                                        // suffixIcon: CupertinoIcons.arrow_right_circle_fill,
                                                        // suffixIconColor: Colors.white,
                                                        title: Text('Approve'),
                                                        backgroundColor:
                                                            const Color
                                                                    .fromARGB(
                                                                255,
                                                                33,
                                                                79,
                                                                243),

                                                        textColor: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        paddingAll: 16,
                                                        borderRadius: 10,
                                                        fontSize: 16,
                                                        onPressed: () {},
                                                      ),
                                                      ButtonBS(
                                                        title: Text('Reject'),
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
                                                        onPressed: () {},
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            )
                                          : SizedBox(),
                                      // Content for Tab 2
                                      ac.GetSupplierDetailsList[0]
                                                      .ContactPersons?.length !=
                                                  0 ||
                                              ac.GetSupplierDetailsList[0]
                                                      .ContactPersons !=
                                                  null
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
                                          : SizedBox(),
                                      // Content for Tab 3
                                      ac
                                                      .GetSupplierDetailsList[0]
                                                      .CustomerAddress
                                                      ?.length !=
                                                  0 ||
                                              ac.GetSupplierDetailsList[0]
                                                      .CustomerAddress !=
                                                  null
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

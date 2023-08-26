// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../ui/Buttons/buttonBS.dart';
import '../../../../ui/widgets/detailed_card.dart';
import '../../customer/approved_bp/controller/approved_bp_controller.dart';
import '../approved_supplier/controller/Approved_supplier_controller.dart';
import 'controller/unapproved_supplier_controller.dart';

class DetailedSupplierScreen extends StatefulWidget {
  final String name;
  final String code;
  const DetailedSupplierScreen(
      {Key? key, required this.name, required this.code})
      : super(key: key);

  @override
  State<DetailedSupplierScreen> createState() => _DetailedSupplierScreenState();
}

class _DetailedSupplierScreenState extends State<DetailedSupplierScreen> {
  UnApprovedSupplierController ac = Get.put(UnApprovedSupplierController());
  ApprovedSupplierController x = Get.put(ApprovedSupplierController());
  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ac.getSupplierDetailsData();
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
                                                      Obx(
                                                        () => ButtonBS(
                                                          title: ac.load
                                                                      .value ==
                                                                  true
                                                              ? Container(
                                                                  height: 25,
                                                                  width: 25,
                                                                  child: CircularProgressIndicator(
                                                                      strokeWidth:
                                                                          1,
                                                                      color: Colors
                                                                          .white))
                                                              : Text(
                                                                  'Approve',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                  ),
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
                                                            ac.load.value =
                                                                true;
                                                            var res = await ac
                                                                .updateSupplierDetailsData(
                                                                    widget.code,
                                                                    "Approved");
                                                            ac.load.value =
                                                                false;
                                                            if (ac.res.value ==
                                                                "Success") {
                                                              print(
                                                                  '!!!!!!!!Approved');
                                                              await ac
                                                                  .getUnApprovedSupplierData();
                                                              ac.filterData('');
                                                              ScaffoldMessenger
                                                                      .of(
                                                                          context)
                                                                  .showSnackBar(
                                                                      SnackBar(
                                                                          content:
                                                                              Text('Approval Successfull')));

                                                              await x
                                                                  .getApprovedSupplierData();

                                                              ac.GetUnApprovedStatusList
                                                                  .refresh();
                                                              ac.filteredData
                                                                  .refresh();
                                                              x.GetApprovedStatusList
                                                                  .refresh();
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
                                                                              Text('Approval Un-Successfull')));
                                                            }
                                                          },
                                                        ),
                                                      ),
                                                      ButtonBS(
                                                        title: ac.load_rejected
                                                                    .value ==
                                                                true
                                                            ? Container(
                                                                height: 25,
                                                                width: 25,
                                                                child:
                                                                    CircularProgressIndicator(
                                                                  strokeWidth:
                                                                      1,
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          33,
                                                                          79,
                                                                          243),
                                                                ))
                                                            : Text(
                                                                'Reject',
                                                                style:
                                                                    TextStyle(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          33,
                                                                          79,
                                                                          243),
                                                                ),
                                                              ),
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
                                                          ac.load_rejected
                                                              .value = true;

                                                          var res = await ac
                                                              .updateSupplierDetailsData(
                                                                  widget.code,
                                                                  "Rejected");
                                                          ac.load_rejected
                                                              .value = false;
                                                          if (ac.res.value ==
                                                              "Success") {
                                                            print(
                                                                '!!!!!!!!Rejected');
                                                            await ac
                                                                .getUnApprovedSupplierData();
                                                            ac.filterData('');
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                                    SnackBar(
                                                                        content:
                                                                            Text('Rejected Successfully')));

                                                            await x
                                                                .getApprovedSupplierData();

                                                            ac.GetUnApprovedStatusList
                                                                .refresh();
                                                            ac.filteredData
                                                                .refresh();
                                                            x.GetApprovedStatusList
                                                                .refresh();
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          } else {
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                                    SnackBar(
                                                                        content:
                                                                            Text('Un-Successfull')));
                                                          }
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            )
                                          : SizedBox(),
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
                                          : SizedBox(),

                                      // Content for Tab 3
                                      ac.GetSupplierDetailsList.length != 0
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
                                                                .GetSupplierDetailsList[
                                                                    0]
                                                                .CustomerAddress?[
                                                                    0]
                                                                .AdresType ??
                                                            "-"
                                                      },
                                                      {
                                                        'subtitle': 'Building',
                                                        'text': ac
                                                                .GetSupplierDetailsList[
                                                                    0]
                                                                .CustomerAddress?[
                                                                    0]
                                                                .Building ??
                                                            "-"
                                                      },
                                                      {
                                                        'subtitle': 'Block',
                                                        'text': ac
                                                                .GetSupplierDetailsList[
                                                                    0]
                                                                .CustomerAddress?[
                                                                    0]
                                                                .Block ??
                                                            "-"
                                                      },
                                                      {
                                                        'subtitle': 'Street',
                                                        'text': ac
                                                                .GetSupplierDetailsList[
                                                                    0]
                                                                .CustomerAddress?[
                                                                    0]
                                                                .Street ??
                                                            "-"
                                                      },
                                                      {
                                                        'subtitle': 'City',
                                                        'text': ac
                                                                .GetSupplierDetailsList[
                                                                    0]
                                                                .CustomerAddress?[
                                                                    0]
                                                                .City ??
                                                            "-"
                                                      },
                                                      {
                                                        'subtitle': 'Country',
                                                        'text': ac
                                                                .GetSupplierDetailsList[
                                                                    0]
                                                                .CustomerAddress?[
                                                                    0]
                                                                .Country ??
                                                            "-"
                                                      },
                                                      {
                                                        'subtitle': 'State',
                                                        'text': ac
                                                                .GetSupplierDetailsList[
                                                                    0]
                                                                .CustomerAddress?[
                                                                    0]
                                                                .State ??
                                                            "-"
                                                      },
                                                      {
                                                        'subtitle': 'Zip Code',
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
                                                            'Ship to Country',
                                                        'text': ac
                                                                .GetSupplierDetailsList[
                                                                    0]
                                                                .CustomerAddress?[
                                                                    0]
                                                                .County ??
                                                            "-"
                                                      },
                                                      {
                                                        'subtitle': 'Address',
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
                                                  ac.GetSupplierDetailsList
                                                              .length ==
                                                          2
                                                      ? DetailsCard(
                                                          title: "Shipping",
                                                          subtitleData: [
                                                            {
                                                              'subtitle':
                                                                  'Address Type',
                                                              'text': ac
                                                                      .GetSupplierDetailsList[
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
                                                                      .GetSupplierDetailsList[
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
                                                                      .GetSupplierDetailsList[
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
                                                                      .GetSupplierDetailsList[
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
                                                                      .GetSupplierDetailsList[
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
                                                                      .GetSupplierDetailsList[
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
                                                                      .GetSupplierDetailsList[
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
                                                                      .GetSupplierDetailsList[
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
                                                                      .GetSupplierDetailsList[
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
                                                                      .GetSupplierDetailsList[
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

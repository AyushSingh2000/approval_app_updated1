// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:new_app/feature/login/controller/login_controller.dart';

import '../../../../ui/widgets/detailed_card.dart';
import '../../../ui/colors/app_colors.dart';
import '../../customer/approved_bp/controller/approved_bp_controller.dart';
import '../approved_supplier/controller/Approved_supplier_controller.dart';
import '../rejected_supplier/controller/rejected_supplier_controller.dart';
import 'controller/unapproved_supplier_controller.dart';

class DetailedSupplierScreen extends StatefulWidget {
  final String name;
  final String code;
  final String group;
  final String requestedBy;
  final String db;
  const DetailedSupplierScreen({
    Key? key,
    required this.name,
    required this.code,
    required this.group,
    required this.requestedBy,
    required this.db,
  }) : super(key: key);

  @override
  State<DetailedSupplierScreen> createState() => _DetailedSupplierScreenState();
}

class _DetailedSupplierScreenState extends State<DetailedSupplierScreen> {
  UnApprovedSupplierController ac = Get.put(UnApprovedSupplierController());
  ApprovedSupplierController apc = Get.put(ApprovedSupplierController());
  RejectedSupplierController rc = Get.put(RejectedSupplierController());
  LoginController lc = Get.put(LoginController());
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
          backgroundColor: AppColors.appbarmainblue,
          elevation: 0,
          title: const Text('Supplier Details'),
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
                      child: SingleChildScrollView(
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
                                    unselectedLabelColor:
                                        Color.fromARGB(255, 189, 189, 189),
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
                                                          'text': ac
                                                                  .GetSupplierDetailsList[
                                                                      0]
                                                                  .CardName ??
                                                              "-"
                                                        },
                                                        {
                                                          'subtitle': 'Code',
                                                          'text': ac
                                                                  .GetSupplierDetailsList[
                                                                      0]
                                                                  .CardCode ??
                                                              "-"
                                                        },
                                                        {
                                                          'subtitle':
                                                              'Currency',
                                                          'text': ac
                                                                  .GetSupplierDetailsList[
                                                                      0]
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
                                                          'subtitle':
                                                              'Telephone',
                                                          'text': ac
                                                                  .GetSupplierDetailsList[
                                                                      0]
                                                                  .Cellular ??
                                                              "-"
                                                        },
                                                        {
                                                          'subtitle':
                                                              'Mobile No',
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
                                                    lc.VendorStatus.value ==
                                                            "Approve"
                                                        ? Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              Obx(
                                                                () => SizedBox(
                                                                  height: 50,
                                                                  width: width *
                                                                      0.33,
                                                                  child:
                                                                      ElevatedButton(
                                                                    style:
                                                                        ButtonStyle(
                                                                      backgroundColor:
                                                                          MaterialStateProperty.all<
                                                                              Color>(
                                                                        AppColors
                                                                            .mainblue,
                                                                      ),
                                                                      shape: MaterialStateProperty
                                                                          .all<
                                                                              RoundedRectangleBorder>(
                                                                        RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(12),
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
                                                                      ac.load1.value =
                                                                          true;
                                                                      var res = await ac.updateSupplierDetailsData(
                                                                          widget
                                                                              .code,
                                                                          "Approved");
                                                                      ac.load1.value =
                                                                          false;

                                                                      if (ac.res
                                                                              .value ==
                                                                          "Success") {
                                                                        await ac
                                                                            .getUnApprovedSupplierData();
                                                                        await apc
                                                                            .getApprovedSupplierData();
                                                                        ac.filterData(
                                                                            '');
                                                                        apc.filterData(
                                                                            '');
                                                                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                                                            content:
                                                                                Text('Successfully Approved')));
                                                                        Navigator.of(context)
                                                                            .pop();
                                                                        ac.sendEmail(
                                                                          subject:
                                                                              'Supplier Master Creation Approval Confirmation | Approved By ${lc.userBy}',
                                                                          message:
                                                                              'We have approved the new Supplier Master and below are the details of the Supplier for your immediate reference. ',
                                                                          cvi:
                                                                              'Supplier',
                                                                          reqestOrApproval:
                                                                              'Approved By',
                                                                          cardCode:
                                                                              '${widget.code}',
                                                                          cardName:
                                                                              '${widget.name}',
                                                                          groupName:
                                                                              '${widget.group}',
                                                                          db: '${widget.db}',
                                                                          requestedBy:
                                                                              '${widget.requestedBy}',
                                                                        );
                                                                      } else {
                                                                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                                                            content:
                                                                                Text('An error has occurred')));
                                                                      }
                                                                    },
                                                                    child: ac.load1.value ==
                                                                            true
                                                                        ? const CircularProgressIndicator(
                                                                            strokeWidth:
                                                                                1,
                                                                            color:
                                                                                Colors.white,
                                                                          )
                                                                        : const Text(
                                                                            'Approve',
                                                                            style:
                                                                                TextStyle(color: Colors.white),
                                                                          ),
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height: 50,
                                                                width: width *
                                                                    0.33,
                                                                child:
                                                                    ElevatedButton(
                                                                  style:
                                                                      ButtonStyle(
                                                                    backgroundColor:
                                                                        MaterialStateProperty.all<
                                                                            Color>(
                                                                      AppColors
                                                                          .appgrey,
                                                                    ),
                                                                    shape: MaterialStateProperty
                                                                        .all<
                                                                            RoundedRectangleBorder>(
                                                                      RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(12),
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
                                                                    Get.defaultDialog(
                                                                      title:
                                                                          'Attention!',
                                                                      content:
                                                                          Column(
                                                                        children: [
                                                                          Container(
                                                                              margin: const EdgeInsets.symmetric(vertical: 10),
                                                                              // height: 50,
                                                                              decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(9)),
                                                                              child: TextFormField(
                                                                                maxLines: 5,
                                                                                decoration: InputDecoration(
                                                                                  border: InputBorder.none,
                                                                                  hintText: 'Remarks',
                                                                                  hintStyle: TextStyle(color: Colors.grey.withOpacity(0.8)),
                                                                                  contentPadding: const EdgeInsets.only(left: 12, top: 12),
                                                                                ),
                                                                                onChanged: (value) {
                                                                                  ac.remarks.value = value;
                                                                                },
                                                                              )),
                                                                          SizedBox(
                                                                              height: 16),
                                                                          Obx(
                                                                            () =>
                                                                                Row(
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                Center(
                                                                                  child: ElevatedButton(
                                                                                      onPressed: () async {
                                                                                        ac.load2.value = true;
                                                                                        var res = await ac.updateSupplierDetailsData(widget.code, "Rejected");
                                                                                        ac.load2.value = false;
                                                                                        if (ac.res.value == "Success") {
                                                                                          await ac.getUnApprovedSupplierData();
                                                                                          await rc.getRejectedSupplierData();
                                                                                          ac.filterData('');
                                                                                          rc.filterData('');
                                                                                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Successfully Rejected')));
                                                                                          Navigator.of(context).pop();
                                                                                          ac.sendEmail_Rejected(subject: ' Supplier Master Creation Request Rejected | Rejected By ${lc.userBy}', message: 'We have rejected the new Supplier Master and below are the details of the Supplier along with the comments for your immediate reference.', cvi: 'Supplier', reqestOrApproval: 'Approved By', cardCode: '${widget.code}', cardName: '${widget.name}', groupName: '${widget.group}', db: '${widget.db}', requestedBy: '${widget.requestedBy}');
                                                                                        } else {
                                                                                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('An error has occurred')));
                                                                                        }
                                                                                      },
                                                                                      style: ButtonStyle(
                                                                                        backgroundColor: MaterialStateProperty.all<Color>(
                                                                                          AppColors.mainblue,
                                                                                        ),
                                                                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                                                          RoundedRectangleBorder(
                                                                                            borderRadius: BorderRadius.circular(12),
                                                                                            // side: const BorderSide(color: Colors.red),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      child: ac.load2.value == true
                                                                                          ? const CircularProgressIndicator(
                                                                                              strokeWidth: 1,
                                                                                              color: Colors.white,
                                                                                            )
                                                                                          : const Text(
                                                                                              'Confirm',
                                                                                              style: TextStyle(
                                                                                                fontSize: 16,
                                                                                                fontWeight: FontWeight.w600,
                                                                                                fontFamily: "Nunito",
                                                                                                color: Colors.white,
                                                                                              ),
                                                                                            )),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          )
                                                                        ],
                                                                      ),
                                                                    );
                                                                    /*

                                                                    */
                                                                  },
                                                                  child:
                                                                      const Text(
                                                                    'Reject',
                                                                    style: TextStyle(
                                                                        color: AppColors
                                                                            .gradientColor1),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          )
                                                        : SizedBox()
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
                                                          'subtitle':
                                                              'Last Name',
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
                                                          'subtitle':
                                                              'Telephone',
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
                      ),
                    )),
            ),
          ),
        ));
  }
}

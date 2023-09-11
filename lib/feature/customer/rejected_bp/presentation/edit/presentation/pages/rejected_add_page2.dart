import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:new_app/feature/customer/approved_bp/data/modal/get_bp_details_modal.dart';
import 'package:new_app/feature/customer/createCustomer/controller/customer_controller.dart';
import 'package:new_app/feature/customer/createCustomer/data/model/BP_post_1.dart';
import 'package:new_app/feature/customer/createCustomer/presentation/pages/customer_add_con.dart';
import 'package:new_app/feature/customer/createCustomer/presentation/pages/customer_add_page3.dart';
import 'package:new_app/feature/customer/createCustomer/presentation/pages/customer_edit_con.dart';
import 'package:new_app/feature/customer/createCustomer/presentation/widgets/add_contact.dart';
import 'package:new_app/ui/Buttons/buttonBS.dart';
import 'package:new_app/ui/colors/app_colors.dart';

import '../../../../controller/rejected_bp_controller.dart';

class EditRejectedCustomerPage2 extends StatefulWidget {
  const EditRejectedCustomerPage2({super.key});

  @override
  State<EditRejectedCustomerPage2> createState() =>
      _EditRejectedCustomerPage2State();
}

class _EditRejectedCustomerPage2State extends State<EditRejectedCustomerPage2> {
  final CustomerController customer_Controller = Get.put(CustomerController());
  RejectedCustomerController rc = Get.put(RejectedCustomerController());

  @override
  void initState() {
    if(rc.GetBPDetailsList!=null){
      for(CardDetail ele in rc.GetBPDetailsList){
        if(ele.ContactPersons!=null){
          for(ContactPerson contactPerson in ele.ContactPersons!){
            customer_Controller.contactemployee.add(
                contactEmployees(
                    CardCode: contactPerson.CardCode,
                    FirstName: contactPerson.FirstName,
                    MiddleName: contactPerson.MiddleName,
                    LastName: contactPerson.LastName,
                    Name: contactPerson.Name,
                    Position: contactPerson.Designation,
                    Address: contactPerson.Address,
                    Phone1: contactPerson.Tel1,
                    Phone2: contactPerson.Tel2,
                    MobilePhone: contactPerson.Cellolar,
                    E_Mail: contactPerson.E_MailL,
                    Active: contactPerson.Active
                )
            );
          }
        }
      }
    }
    super.initState();
  }

  @override
  void dispose() {
    print("Dispose, was called");
    customer_Controller.contactemployee.value = [];
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appbarmainblue,
        title: const Text(
          'Contacts',
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => const CustomerPage_2_1());
            },
            icon: const Icon(Icons.add),
          )
        ],
        elevation: 0,
      ),
      body: Obx(() {
        final ct = customer_Controller.contactemployee;
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: ct.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      color: const Color.fromARGB(255, 232, 232, 232),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.person,
                              color: AppColors.appbarmainblue,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(ct[index].FirstName ?? ''),
                            const Spacer(),
                            IconButton(
                                padding: EdgeInsets.zero,
                                constraints: const BoxConstraints(),
                                onPressed: () {
                                  Get.to(() => CustomerEditPage(index));
                                },
                                icon: const Icon(Icons.edit)),
                            IconButton(
                                constraints: BoxConstraints(),
                                padding: EdgeInsets.zero,
                                onPressed: () async {
                                  bool isyes =
                                      await showConfirmationDialog(context);
                                  if (isyes == true) ct.removeAt(index);
                                },
                                icon: Icon(Icons.delete))
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const Spacer(),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                ButtonBS(
                  height: 40,
                  borderRadius: 12,
                  backgroundColor: AppColors.appbarmainblue,
                  title: Text(
                    'Back',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Get.back();
                  },
                ),
                ButtonBS(
                  height: 40,
                  borderRadius: 12,
                  backgroundColor: AppColors.appbarmainblue,
                  title: Text(
                    'Next',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => const CustomerPage_3()));
                    // Get.to(() => CustomerPage_3());
                  },
                )
              ]),
            ],
          ),
        );
      }),
    );
  }
}

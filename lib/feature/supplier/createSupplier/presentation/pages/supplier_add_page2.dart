import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:new_app/feature/supplier/createSupplier/presentation/pages/supplier_add_con.dart';
import 'package:new_app/feature/supplier/createSupplier/presentation/pages/supplier_add_page3.dart';
import 'package:new_app/feature/supplier/createSupplier/presentation/pages/supplier_edit_con.dart';
import 'package:new_app/ui/Buttons/buttonBS.dart';
import '../../../../customer/createCustomer/presentation/widgets/add_contact.dart';
import '../../controller/supplier_controller.dart';

class SupplierPage_2 extends StatefulWidget {
  const SupplierPage_2({super.key});

  @override
  State<SupplierPage_2> createState() => _SupplierPage_2State();
}

class _SupplierPage_2State extends State<SupplierPage_2> {
  @override
  Widget build(BuildContext context) {
    final SupplierController customer_Controller =
        Get.put(SupplierController());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Contacts',
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => const SupplierPage_2_1());
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
                              color: Colors.blue,
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
                                  Get.to(() => SupplierEditPage(index));
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
                  backgroundColor: Colors.blue,
                  textColor: Colors.white,
                  title: Text(
                    'Back',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    Get.back();
                  },
                ),
                ButtonBS(
                  height: 40,
                  borderRadius: 12,
                  backgroundColor: Colors.blue,
                  textColor: Colors.white,
                  title: Text(
                    'Next',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => const SupplierPage_3()));
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

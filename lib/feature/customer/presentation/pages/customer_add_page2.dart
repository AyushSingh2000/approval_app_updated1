import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:new_app/feature/customer/controller/customer_controller.dart';
import 'package:new_app/feature/customer/presentation/pages/customer_add_con.dart';
import 'package:new_app/feature/customer/presentation/pages/customer_add_page3.dart';
import 'package:new_app/feature/customer/presentation/pages/customer_edit_con.dart';
import 'package:new_app/ui/Buttons/buttonBS.dart';

class CustomerPage_2 extends StatefulWidget {
  const CustomerPage_2({super.key});

  @override
  State<CustomerPage_2> createState() => _CustomerPage_2State();
}

class _CustomerPage_2State extends State<CustomerPage_2> {
  @override
  Widget build(BuildContext context) {
    final CustomerController customer_Controller =
        Get.put(CustomerController());
    return Scaffold(
      appBar: AppBar(
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
                                  Get.to(() => CustomerEditPage(index));
                                },
                                icon: const Icon(Icons.edit)),
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
                  title: 'Back',
                  onPressed: () {
                    Get.back();
                  },
                ),
                ButtonBS(
                  height: 40,
                  borderRadius: 12,
                  backgroundColor: Colors.blue,
                  textColor: Colors.white,
                  title: 'Next',
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

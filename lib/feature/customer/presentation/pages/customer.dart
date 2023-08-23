import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app/feature/customer/presentation/pages/customer_add_page1.dart';

class Customer_add extends StatefulWidget {
  const Customer_add({super.key});

  @override
  State<Customer_add> createState() => _Customer_addState();
}

class _Customer_addState extends State<Customer_add> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customer list'),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => CustomerPage());
            },
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: const Center(
        child: Text('Customer list'),
      ),
    );
  }
}

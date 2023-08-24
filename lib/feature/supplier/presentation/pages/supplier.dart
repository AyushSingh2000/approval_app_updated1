import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app/feature/customer/presentation/pages/customer_add_page1.dart';

class SupplierPage extends StatefulWidget {
  const SupplierPage({super.key});

  @override
  State<SupplierPage> createState() => _SupplierPageState();
}

class _SupplierPageState extends State<SupplierPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Supplier list'),
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
        child: Text('Supplier list'),
      ),
    );
  }
}

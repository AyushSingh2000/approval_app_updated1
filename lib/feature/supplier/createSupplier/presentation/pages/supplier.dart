import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app/feature/supplier/createSupplier/presentation/pages/supplier_add_page1.dart';
// import 'package:new_app/feature/customer/presentation/pages/rejected_add_page1.dart';
// import 'package:new_app/feature/supplier/presentation/pages/supplier_add_page1.dart';

class Supplier_Add extends StatefulWidget {
  const Supplier_Add({super.key});

  @override
  State<Supplier_Add> createState() => _Supplier_AddState();
}

class _Supplier_AddState extends State<Supplier_Add> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Supplier list'),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => SupplierPage());
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

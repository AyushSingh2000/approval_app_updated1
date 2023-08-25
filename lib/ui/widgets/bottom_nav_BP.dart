import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app/feature/approved_bp/presentation/pages/approved_bp.dart';
import 'package:new_app/feature/customer/presentation/pages/customer.dart';
import 'package:new_app/feature/supplier/presentation/pages/supplier.dart';
import 'package:new_app/feature/unapproved_bp/presentation/pages/unapproved_bp.dart';

Widget BottomNavBP(int currentIndex) {
  return ClipRRect(
    borderRadius: const BorderRadius.only(
      topLeft: Radius.circular(26),
      topRight: Radius.circular(26),
    ),
    child: BottomNavigationBar(
      backgroundColor: Colors.blue,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          activeIcon: Icon(Icons.home),
          label: 'Approved',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.people_outline),
          activeIcon: Icon(Icons.people),
          label: 'UnApproved',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons
              .water_drop_outlined), //Image.asset(AppImagePaths.petrolIcon, scale: 3,),
          activeIcon: Icon(Icons.water_drop),
          label: 'Customer',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons
              .oil_barrel_outlined), //Image.asset(AppImagePaths.dieselIcon, scale: 3,),
          activeIcon: Icon(Icons.oil_barrel),
          label: 'Supplier',
        ),
      ],
      currentIndex: currentIndex,
      onTap: (index) {
        switch (index) {
          case 0:
            Get.to(ApprovedBPScreen());
          case 1:
            Get.to(UnApprovedBPScreen());
          case 2:
            Get.to(Customer_add());
          case 3:
            Get.to(Supplier_Add());
        }
      },
    ),
  );
}

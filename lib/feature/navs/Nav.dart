import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../customer/Blank_bp/presentation/pages/blank_bp.dart';
import '../customer/approved_bp/presentation/pages/approved_bp.dart';
import '../customer/rejected_bp/presentation/pages/rejected_bp.dart';
import '../customer/unapproved_bp/presentation/pages/unapproved_bp.dart';
import '../item/approved_item/presentation/pages/approved_item.dart';
import '../item/blank_item/presentation/pages/blank_item.dart';
import '../item/createItem/presentation/pages/items.dart';
import '../item/rejected_item/presentation/pages/rejected_item.dart';
import '../item/unapproved_item/presentation/pages/unapproved_item.dart';
import '../login/controller/login_controller.dart';
import '../supplier/approved_supplier/presentation/pages/approved_supplier.dart';
import '../supplier/blank_supplier/presentation/pages/blank_supplier.dart';
import '../supplier/rejected_supplier/presentation/pages/rejected_supplier.dart';
import '../supplier/unapproved_supplier/unapproved_supplier.dart';

class NavScreen extends StatefulWidget {
  final int index;
  const NavScreen({super.key, required this.index});

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  LoginController lc = Get.put(LoginController());
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      lc.pageNumber.value = index;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    lc.pageNumber.value = 0;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text('Approved BP List'),
        // ),
        // body: const Center(
        //   child: Text('Approved List'),
        // ),
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(26),
            topRight: Radius.circular(26),
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.blue,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            items: widget.index == 0
                ? const <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home_outlined),
                      activeIcon: Icon(Icons.home),
                      label: 'Blank',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.people_outline),
                      activeIcon: Icon(Icons.people),
                      label: 'Un-Approved',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons
                          .water_drop_outlined), //Image.asset(AppImagePaths.petrolIcon, scale: 3,),
                      activeIcon: Icon(Icons.water_drop),
                      label: 'Approved',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons
                          .oil_barrel_outlined), //Image.asset(AppImagePaths.dieselIcon, scale: 3,),
                      activeIcon: Icon(Icons.oil_barrel),
                      label: 'Rejected',
                    ),
                  ]
                : widget.index == 1
                    ? const <BottomNavigationBarItem>[
                        BottomNavigationBarItem(
                          icon: Icon(Icons.home_outlined),
                          activeIcon: Icon(Icons.home),
                          label: 'Blank',
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(Icons.people_outline),
                          activeIcon: Icon(Icons.people),
                          label: 'Un-Approved',
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(Icons
                              .water_drop_outlined), //Image.asset(AppImagePaths.petrolIcon, scale: 3,),
                          activeIcon: Icon(Icons.water_drop),
                          label: 'Approved',
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(Icons
                              .oil_barrel_outlined), //Image.asset(AppImagePaths.dieselIcon, scale: 3,),
                          activeIcon: Icon(Icons.oil_barrel),
                          label: 'Rejected',
                        ),
                      ]
                    : const <BottomNavigationBarItem>[
                        BottomNavigationBarItem(
                          icon: Icon(Icons.home_outlined),
                          activeIcon: Icon(Icons.home),
                          label: 'Blank',
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(Icons.home_outlined),
                          activeIcon: Icon(Icons.home),
                          label: 'UnApproved',
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(Icons.people_outline),
                          activeIcon: Icon(Icons.people),
                          label: 'Approved',
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(Icons
                              .water_drop_outlined), //Image.asset(AppImagePaths.petrolIcon, scale: 3,),
                          activeIcon: Icon(Icons.water_drop),
                          label: 'Item',
                        ),
                      ],
            currentIndex: _selectedIndex,
            onTap: (index) {
              _onItemTapped(index);
            },
          ),
        ),
        body: GetBuilder<LoginController>(builder: (controller) {
          return Builder(
            builder: widget.index == 0
                ? (context) {
                    switch (lc.pageNumber.value) {
                      case 0:
                        return const BlankBPScreen();

                      case 1:
                        return const UnApprovedBPScreen();

                      case 2:
                        return const ApprovedBPScreen();

                      case 3:
                        return RejectedBPScreen();
                      default:
                        return const Center(child: Text("Work in Progress"));
                    }
                  }
                : widget.index == 1
                    ? (context) {
                        switch (lc.pageNumber.value) {
                          case 0:
                            return const BlankSupplierScreen();

                          case 1:
                            return const UnApprovedSupplierScreen();

                          case 2:
                            return const ApprovedSupplierScreen();

                          case 3:
                            return RejectedSupplierScreen();
                          default:
                            return const Center(
                                child: Text("Work in Progress"));
                        }
                      }
                    : (context) {
                        switch (lc.pageNumber.value) {
                          case 0:
                            return const BlankItemScreen();
                          case 1:
                            return const UnApprovedItemScreen();
                          case 2:
                            return ApprovedItemScreen();
                          case 3:
                            return RejectedItemScreen();
                          default:
                            return const Center(
                                child: Text("Work in Progress"));
                        }
                      },
          );
        }));
  }
}

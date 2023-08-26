// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../feature/item/approved_item/presentation/pages/rejected_item.dart';
// import '../../feature/item/createItem/presentation/pages/items.dart';
// import '../../feature/item/unapproved_item/presentation/pages/unapproved_item.dart';
//
//
// Widget BottomNavItem(int currentIndex){
//   return ClipRRect(
//           borderRadius: const BorderRadius.only(
//             topLeft: Radius.circular(26),
//             topRight: Radius.circular(26),
//           ),
//           child: BottomNavigationBar(
//             backgroundColor: Colors.blue,
//             selectedItemColor: Colors.white,
//             unselectedItemColor: Colors.white,
//             type: BottomNavigationBarType.fixed,
//             items: const <BottomNavigationBarItem>[
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.home_outlined),
//                 activeIcon: Icon(Icons.home),
//                 label: 'Approved',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.people_outline),
//                 activeIcon: Icon(Icons.people),
//                 label: 'UnApproved',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.water_drop_outlined), //Image.asset(AppImagePaths.petrolIcon, scale: 3,),
//                 activeIcon: Icon(Icons.water_drop),
//                 label: 'Item',
//               ),
//             ],
//             currentIndex: currentIndex,
//             onTap: (index) {
//               switch(index){
//                 case 0:
//                   Get.to(ApprovedItemScreen());
//                 case 1:
//                   Get.to(UnApprovedItemScreen());
//                 case 2:
//                   Get.to(ItemsPage());
//               }
//             },
//           ),
//         );
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../ui/Buttons/buttonBS.dart';
import '../../Nav.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(alignment: Alignment.center, children: [
            Container(
              clipBehavior: Clip.hardEdge,
              height: MediaQuery.sizeOf(context).height * 0.85,
              child: Image.asset(
                'lib/ui/assets/homescreen.jpg',
                fit: BoxFit.cover,
              ),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              )),
            ),
            const Positioned(
              top: 40,
              child: Padding(
                padding: EdgeInsets.only(top: 48.0),
                child: Text(
                  'Welcome', // Add Welcome text here
                  style: TextStyle(
                    fontSize: 50,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const Positioned(
              bottom: 40,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "We're excited to have you \n on board.",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // Text('Streamline Your Customer \n and Item Management',
                  // style: TextStyle(
                  //       fontSize: 20,
                  //       fontWeight: FontWeight.w500,
                  //       color: Colors.white),
                  //       textAlign: TextAlign.center,
                  //       ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  Text(
                    'This app is here to simplify your \n customer and  item management tasks, \n making your daily operations smoother \n than ever before. ',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w200,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            )
          ]),
          const Spacer(),

          // Add Spacer to push buttons to the bottom
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ButtonBS(
                // prefixIcon: CupertinoIcons.cube_box,
                // prefixIconColor: Colors.white,
                // suffixIcon: CupertinoIcons.arrow_right_circle_fill,
                // suffixIconColor: Colors.white,
                title: 'Item Master',
                backgroundColor: const Color.fromARGB(255, 228, 228, 228),
                textColor: const Color.fromARGB(255, 33, 79, 243),
                fontWeight: FontWeight.w500,
                paddingAll: 16,
                borderRadius: 10,
                fontSize: 16,
                onPressed: () {
                  // Get.to(ApprovedItemScreen());
                  Get.to(const NavScreen(
                    index: 1,
                  ));
                },
              ),
              ButtonBS(
                // prefixIcon: CupertinoIcons.profile_circled,
                // prefixIconColor: Colors.white,
                // suffixIcon: CupertinoIcons.arrow_right_circle_fill,
                // suffixIconColor: Colors.white,
                title: 'BP Master',
                backgroundColor: const Color.fromARGB(255, 33, 79, 243),
                textColor: Colors.white,
                fontWeight: FontWeight.w500,
                paddingAll: 16,
                borderRadius: 10,
                fontSize: 16,
                onPressed: () {
                  Get.to(const NavScreen(index: 0));
                },
              ),
            ],
          ), // Add some spacing between the buttons

          const Spacer(
            flex: 1,
          ),
        ],
      ),
    );
  }
}

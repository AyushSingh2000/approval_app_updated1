import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app/feature/home_screen/presentation/homescreen.dart';
import 'package:new_app/feature/login/controller/login_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../login/presentation/pages/login.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  bool animate = false;
  bool logindetail = false;
  LoginController loginController = Get.put(LoginController());

  @override
  void initState() {
    unawaited(_checkSplash());
    getlogin();
    super.initState();
  }

 

  Future<void> _checkSplash() async {
    await Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        animate = true;
      });
    });
    await Future.delayed(const Duration(seconds: 3), () {
      logindetail==false?Get.off(const LoginPage()):Get.off(const HomeScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedPositioned(
              curve: Curves.easeInOut,
              top: animate ? width : -50,
              left: animate ? width - 125 : -50,
              duration: const Duration(milliseconds: 2500),
              child: const CircleAvatar(
                backgroundColor: Color.fromARGB(255, 111, 75, 2),
                radius: 125,
              )),
          AnimatedPositioned(
              curve: Curves.easeInOut,
              top: animate ? width / 2 : height - 100,
              left: animate ? -100 : width - 50,
              duration: const Duration(milliseconds: 2500),
              child: const CircleAvatar(
                backgroundColor: Color.fromARGB(255, 85, 73, 174),
                radius: 180,
              )),
          BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 80,
              sigmaY: 80,
            ),
            child: Container(),
          ),
          Center(
            child: AnimatedOpacity(
              opacity: animate ? 1 : 0,
              curve: Curves.easeInExpo,
              duration: const Duration(milliseconds: 2000),
              child: Image.asset(
                'lib/ui/assets/splash.png',
              ),
            ),
          ),
          AnimatedPositioned(
            curve: Curves.easeInOut,
            top: animate ? height * 0.1 : height * 0.08,
            duration: const Duration(milliseconds: 2500),
            child: AnimatedOpacity(
              opacity: animate ? 1 : 0,
              duration: const Duration(milliseconds: 1500),
              child: SizedBox(
                  width: width * 0.6,
                  child: Image.asset(
                    "lib/ui/assets/logosplash.png",
                  )),
            ),
          ),
          AnimatedPositioned(
            curve: Curves.easeInOut,
            top: animate ? height * 0.22 : height * 0.19,
            duration: const Duration(milliseconds: 2500),
            child: AnimatedOpacity(
              opacity: animate ? 1 : 0,
              duration: const Duration(milliseconds: 1500),
              child: Text(
                'APPROVAL 360',
                style: TextStyle(
                    fontSize: height * 0.05,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Inter'),
              ),
            ),
          ),
          AnimatedPositioned(
            curve: Curves.easeInOut,
            top: animate ? height * 0.75 : height * 0.80,
            duration: const Duration(milliseconds: 2500),
            child: AnimatedOpacity(
              opacity: animate ? 1 : 0,
              duration: const Duration(milliseconds: 1500),
              child: Text(
                'Streamline and accelerate \n approvals with our intuitive \n and efficient management app.',
                style: TextStyle(
                    fontSize: height * 0.02,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Inter'),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          AnimatedPositioned(
            curve: Curves.easeInOut,
            top: animate ? height * 0.85 : height * 0.90,
            duration: const Duration(milliseconds: 2500),
            child: AnimatedOpacity(
              opacity: animate ? 1 : 0,
              duration: const Duration(milliseconds: 1500),
              child: Text(
                'powered by tekroi',
                style: TextStyle(
                    fontSize: height * 0.02,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Inter'),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
   void getlogin() async {
    var prefs = await SharedPreferences.getInstance();
    var companyDB = prefs.getString("companyDB");
    var username = prefs.getString("username");
    var VendorStatus = prefs.getString("VendorStatus");
    var CustomerStatus = prefs.getString("CustomerStatus");
    var ItemStatus = prefs.getString("ItemStatus");
    var userBy = prefs.getString("userBy");
    var databaseList = prefs.getStringList("databaseList");

    if(companyDB!=null || username!=null || VendorStatus!=null || CustomerStatus!=null || ItemStatus!=null || userBy!=null || databaseList!=null){
      logindetail=true;
      loginController.companyDB = companyDB!;
      loginController.username = username!;
      loginController.VendorStatus.value = VendorStatus!;
      loginController.CustomerStatus.value = CustomerStatus!;
      loginController.ItemStatus.value = ItemStatus!;
      loginController.userBy.value = userBy!;
      loginController.databaseList.value = databaseList!;
    }
  }
}

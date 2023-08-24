import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../login/presentation/pages/login.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  bool animate = false;

  @override
  void initState() {
    unawaited(_checkSplash());
    super.initState();
  }

  Future<void> _checkSplash() async {
    await Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        animate = true;
      });
    });
    await Future.delayed(const Duration(seconds: 3), () {
      Get.off(LoginPage());
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
                backgroundColor: Colors.lightBlueAccent,
                radius: 125,
              )),
          AnimatedPositioned(
              curve: Curves.easeInOut,
              top: animate ? width / 2 : height - 100,
              left: animate ? -100 : width - 50,
              duration: const Duration(milliseconds: 2500),
              child: const CircleAvatar(
                backgroundColor: Color.fromARGB(255, 54, 85, 172),
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
              child: Image.asset('lib/ui/assets/splash.png'),
            ),
          ),
          AnimatedPositioned(
            curve: Curves.easeInOut,
            top: animate ? height*0.15 : height*0.12,
           
            duration: const Duration(milliseconds: 2500),
            child: AnimatedOpacity(
              opacity: animate ? 1 : 0,
              duration: const Duration(milliseconds: 1500),
              child: Text('Approval App',style: TextStyle(fontSize: height*0.05,fontWeight: FontWeight.bold,fontFamily: 'Inter'),),
            ),
          ),
          AnimatedPositioned(
            curve: Curves.easeInOut,
            top: animate ? height*0.8 : height*0.85,
           
            duration: const Duration(milliseconds: 2500),
            child: AnimatedOpacity(
              opacity: animate ? 1 : 0,
              duration: const Duration(milliseconds: 1500),
              child: Text('Streamline and accelerate \n approvals with our intuitive \n and efficient management app.',style: TextStyle(fontSize:height*0.02,fontWeight: FontWeight.normal,fontFamily: 'Inter'),
              textAlign: TextAlign.center,),
            ),
          ),
        ],
      ),
    );
  }
}

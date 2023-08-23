import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../login/presentation/pages/login.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    unawaited(_checkSplash());
    super.initState();
  }

  Future<void> _checkSplash() async {
    await Future.delayed(const Duration(seconds: 3), () {
      Get.off(LoginPage());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Approval',
                style: TextStyle(
                  color: Color(0xFFAA7B1F),
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: ' App',
                style: TextStyle(
                  color: Color(0xFF5447A0),
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

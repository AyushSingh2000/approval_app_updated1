import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'feature/splash/presentation/pages/splash.dart';
import 'ui/colors/app_colors.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Approval App',
      theme: ThemeData(
          primaryColorLight: AppColors.appbarmainblue,
          fontFamily: "Inter",
          primaryColor: AppColors.primary,
          textSelectionTheme: const TextSelectionThemeData(
              cursorColor: AppColors.appbarmainblue,
              selectionHandleColor: Colors.transparent)),
      home: const SplashPage(),
    );
  }
} //1001  123

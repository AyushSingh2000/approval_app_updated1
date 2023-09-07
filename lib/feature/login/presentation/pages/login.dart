import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:new_app/core/post_enum_response.dart';
import 'package:new_app/feature/home_screen/presentation/homescreen.dart';
import 'package:new_app/ui/colors/app_colors.dart';
import 'package:quickalert/quickalert.dart';

import '../../controller/login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginController loginController = Get.put(LoginController(), permanent: true);

  List<String> database = [
    'TESTAC0718',
    'database 2',
    'database 3',
    'database 4',
    'database 5',
  ];

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  // static const boolSharedPreference = "login";
  // static Future setBool() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   prefs.setBool(boolSharedPreference, true);
  // }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Container(
          height: height,
          width: width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomCenter,
              colors: [Color.fromARGB(255, 216, 216, 216), Colors.white],
            ),
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: height * 0.14,
                ),
                Padding(
                  padding: EdgeInsets.only(left: width * 0.075),
                  child: Text(
                    "Let's sign you in.",
                    style: TextStyle(
                        fontSize: 35,
                        color: Colors.black,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(width * 0.075),
                  child: Text(
                    "Welcome back \nYou've been missed!",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.w300),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(width * 0.075),
                  child: Container(
                    height: height * 0.44,
                    width: width * 0.85,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              offset: const Offset(0, 1),
                              blurRadius: 1,
                              spreadRadius: 0,
                              blurStyle: BlurStyle.normal),
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // const Text('Select Database'),
                          // Container(
                          //   margin: const EdgeInsets.symmetric(vertical: 10),
                          //   height: 60,
                          //   child: TextDropdownFormField(
                          //     decoration: InputDecoration(
                          //       enabled: false,
                          //       fillColor: Colors.grey[200],
                          //       suffixIcon: const Icon(
                          //         CupertinoIcons.arrowtriangle_down_circle_fill,
                          //         color: AppColors.mainblue,
                          //       ),
                          //       border: OutlineInputBorder(
                          //           borderSide: BorderSide.none,
                          //           borderRadius: BorderRadius.circular(9)),
                          //       hintText: 'Select',
                          //       filled: true,
                          //       hintStyle: const TextStyle(
                          //           fontWeight: FontWeight.bold,
                          //           color: Colors.black),
                          //       contentPadding: const EdgeInsets.only(
                          //           left: 12, right: 12, top: 14),
                          //       isCollapsed: true,
                          //     ),
                          //     options: database,
                          //     onChanged: (dynamic value) {
                          //       loginController.companyDB = value;
                          //     },
                          //   ),
                          // ),
                          // SizedBox(
                          //   height: height * 0.01,
                          // ),
                          const Text('User Name'),
                          Container(
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(9)),
                              child: TextFormField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Your username here',
                                    hintStyle: TextStyle(
                                        color: Colors.grey.withOpacity(0.8)),
                                    contentPadding:
                                        const EdgeInsets.only(left: 12)),
                                onChanged: (value) {
                                  loginController.username = value;
                                },
                              )),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          const Text('Password'),
                          Obx(
                            () => Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 10),
                                height: 50,
                                decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(9)),
                                child: TextFormField(
                                  obscureText:
                                      loginController.password_visible.value,
                                  obscuringCharacter: '•',
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Your password here',
                                    hintStyle: TextStyle(
                                        color: Colors.grey.withOpacity(0.8)),
                                    contentPadding: const EdgeInsets.only(
                                        left: 12, top: 15),
                                    suffixIcon: GestureDetector(
                                        onTap: () {
                                          loginController.toggleVisiblity();
                                        },
                                        child: loginController
                                                .password_visible.value
                                            ? const Icon(
                                                CupertinoIcons.eye_slash_fill,
                                                color: AppColors.mainblue,
                                              )
                                            : const Icon(
                                                CupertinoIcons.eye_fill,
                                                color: AppColors.mainblue,
                                              )),
                                  ),
                                  onChanged: (value) {
                                    loginController.password = value;
                                  },
                                )),
                          ),
                          SizedBox(
                            height: height * 0.03,
                          ),
                          Center(
                            child: SizedBox(
                              height: 50,
                              width: width * 0.33,
                              child: ElevatedButton(
                                  onPressed: () async {
                                    if (loginController.username.isEmpty) {
                                      await QuickAlert.show(
                                        context: context,
                                        type: QuickAlertType.warning,
                                        text: "Enter Username",
                                      );

                                      return;
                                    }

                                    if (loginController.password.isEmpty) {
                                      await QuickAlert.show(
                                        context: context,
                                        type: QuickAlertType.warning,
                                        text: "Enter Password",
                                      );

                                      return;
                                    }

                                    // if (loginController.companyDB.isEmpty) {
                                    //   await QuickAlert.show(
                                    //     context: context,
                                    //     type: QuickAlertType.warning,
                                    //     text: "Select Database",
                                    //   );
                                    //
                                    //   return;
                                    // }

                                    PostResponseType loginResponse =
                                        await loginController.login();
                                    print(loginResponse.postResponseEnum);
                                    if (loginResponse.postResponseEnum ==
                                            PostResponseEnum.error ||
                                        loginResponse.postResponseEnum ==
                                            PostResponseEnum.failed) {
                                      // ignore: use_build_context_synchronously
                                      await QuickAlert.show(
                                        context: context,
                                        type: QuickAlertType.error,
                                        text: "Login Failed",
                                      );

                                      return;
                                    } else {

                                      final prefs =
                                          await SharedPreferences.getInstance();
                                      prefs.setString("companyDB", loginController.companyDB);
                                      prefs.setString("username", loginController.username);
                                      prefs.setString("VendorStatus", loginController.VendorStatus.value);
                                      prefs.setString("CustomerStatus", loginController.CustomerStatus.value);
                                      prefs.setString("ItemStatus", loginController.ItemStatus.value);
                                      prefs.setString("userBy", loginController.userBy.value);
                                      prefs.setStringList("databaseList", loginController.databaseList.value);


                                      // prefs.setBool('login', true);

                                      Get.off(const HomeScreen());
                                    }
                                  },
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                      AppColors.mainblue,
                                    ),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        // side: const BorderSide(color: Colors.red),
                                      ),
                                    ),
                                  ),
                                  child: Obx(
                                      () => loginController.loginLoading.value
                                          ? const CircularProgressIndicator(
                                              strokeWidth: 1,
                                              color: Colors.white,
                                            )
                                          : const Text(
                                              'Sign In',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                fontFamily: "Nunito",
                                                color: Colors.white,
                                              ),
                                            ))),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

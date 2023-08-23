import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:new_app/core/post_enum_response.dart';
import 'package:new_app/feature/home_screen/presentation/homescreen.dart';
import 'package:quickalert/quickalert.dart';

import '../../controller/login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginController loginController = Get.put(LoginController());

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

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: height * 0.14,
            ),
            Center(
              child: Text(
                'Approval App',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: height * 0.06,
            ),
            Container(
              height: height * 0.6,
              width: width * 0.85,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        offset: Offset(0, 10),
                        blurRadius: 7,
                        spreadRadius: 0,
                        blurStyle: BlurStyle.normal),
                  ]),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Select Database'),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      height: 60,
                      child: TextDropdownFormField(
                        decoration: InputDecoration(
                          enabled: false,
                          fillColor: Colors.grey[50],
                          suffixIcon: const Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(9)),
                          hintText: 'Select',
                          filled: true,
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                          contentPadding: const EdgeInsets.only(
                              left: 12, right: 12, top: 14),
                          isCollapsed: true,
                        ),
                        options: database,
                        onChanged: (dynamic value) {
                          loginController.companyDB = value;
                        },
                      ),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Text('User Name'),
                    Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.grey[50],
                            borderRadius: BorderRadius.circular(9)),
                        child: TextFormField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Your username here',
                              hintStyle: TextStyle(
                                  color: Colors.grey.withOpacity(0.7)),
                              contentPadding: EdgeInsets.only(left: 12)),
                          onChanged: (value) {
                            loginController.username = value;
                          },
                        )),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Text('Password'),
                    Obx(
                      () => Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.grey[50],
                              borderRadius: BorderRadius.circular(9)),
                          child: TextFormField(
                            obscureText: loginController.password_visible.value,
                            obscuringCharacter: '*',
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Your password here',
                              hintStyle: TextStyle(
                                  color: Colors.grey.withOpacity(0.7)),
                              contentPadding:
                                  EdgeInsets.only(left: 12, top: 15),
                              suffixIcon: GestureDetector(
                                  onTap: () {
                                    loginController.toggleVisiblity();
                                  },
                                  child: loginController.password_visible.value
                                      ? Icon(
                                          Icons.visibility_off,
                                          color: Colors.black,
                                        )
                                      : Icon(
                                          Icons.visibility,
                                          color: Colors.black,
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

                              if (loginController.companyDB.isEmpty) {
                                await QuickAlert.show(
                                  context: context,
                                  type: QuickAlertType.warning,
                                  text: "Select Database",
                                );

                                return;
                              }

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
                                Get.off(HomeScreen());
                              }
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.amber,
                              ),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  // side: const BorderSide(color: Colors.red),
                                ),
                              ),
                            ),
                            child: Obx(() => loginController.loginLoading.value
                                ? const CircularProgressIndicator()
                                : const Text(
                                    'Sign In',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "Nunito",
                                      color: Colors.black,
                                    ),
                                  ))),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

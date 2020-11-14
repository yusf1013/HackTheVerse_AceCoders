import 'dart:async';

import 'package:ecommerce/delivery/home.dart';
import 'package:ecommerce/domain/admin.dart';
import 'package:ecommerce/home/admin_page.dart';
import 'package:ecommerce/home/delivery_person.dart';
import 'package:ecommerce/home/home_page.dart';
import 'package:ecommerce/model/global_data.dart';
import 'package:ecommerce/model/initialize.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:get/get.dart';

import 'firebase_auth.dart';
import 'login_controller.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Duration get loginTime => Duration(milliseconds: 2250);

  LogInController controller = Get.put(LogInController());

  FireBaseAuthManager fireAuth = FireBaseAuthManager();

  initState() {
    Initialize().initEssentials();
    super.initState();
  }

  Future<String> _logIn(LoginData data) async {
    bool login = await fireAuth.fireBaseBasicSignIn(data);
    if (login)
      return null;
    else
      return "Incorrect email or password! $login";
  }

  Future<String> _signUp(LoginData data) async {
    bool done = await fireAuth.fireBaseBasicSignUp(data);
    if (done)
      return null;
    else
      return "Account creation failed!";
  }

  Future<String> _recoverPassword(String name) {
    print('Name: $name');
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Obx(() => ModalProgressHUD(
          inAsyncCall: controller.isLoading.value,
          child: Stack(
            children: <Widget>[
              FlutterLogin(
                title: 'Chat App',
                theme: LoginTheme(
                  titleStyle: GoogleFonts.spicyRice(
                    textStyle: TextStyle(color: Colors.white, fontSize: 35),
                  ),
                ),
                logo: null,
                logoTag: "logo",
                onLogin: _logIn,
                onSignup: _signUp,
                onSubmitAnimationCompleted: () {
                  navigateToHome();
                },
                onRecoverPassword: _recoverPassword,
              ),
              Positioned(
                bottom: 0,
                child: SizedBox(
                  height: 95,
                  width: width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Divider(
                                color: Colors.black87,
                              ),
                            ),
                            Text(
                              "    OR    ",
                              style: TextStyle(
                                inherit: false,
                                color: Colors.black54,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: FlatButton(
                            onPressed: () async {
                              bool log = await controller.googleAuth();
                              if (log) {
                                navigateToHome();
                              }
                            },
                            child: Image.asset(
                              'assets/images/google_signin_button.png',
                              height: 55,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  void navigateToHome() {
    // Get.to(HomePage());
    GlobalDataController data = Get.find();
    if (data.currentUser.type == "admin")
      Get.to(AdminPage());
    else if (data.currentUser.type == "manager")
      Get.to(ManagerHomePage());
    else if (data.currentUser.type == "delivery") Get.to(DeliveryHomePage());
    print(data.currentUser.toJson());
  }
}

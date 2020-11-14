import 'package:ecommerce/kavi/qr_scanner.dart';
import 'package:ecommerce/home/home_page.dart';
import 'package:ecommerce/sujon/admin_home_page.dart';
import 'package:ecommerce/sujon/report_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/root_widget.dart';

import 'auth/LoginPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus.unfocus();
        }
      },
      child: GetMaterialApp(
        title: 'Telegram Clone',
        theme: ThemeData(
          primaryColor: Colors.red,
          accentColor: Color(0xFFFEF9EB),
        ),
        // home: LoginScreen(),
        home: AdminHomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

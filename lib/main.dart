import 'package:ecommerce/kavi/qr_scanner.dart';
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
        home: Scanner(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'firebase_auth.dart';

class SignOutButton extends StatelessWidget {
  final Color borderColor;
  final Color bodyColor;

  SignOutButton(
      {this.borderColor = Colors.red, this.bodyColor = Colors.transparent});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
        side: BorderSide(color: borderColor),
      ),
      child: Text("Logout"),
      color: bodyColor,
      onPressed: () {
        FireBaseAuthManager().signOut();
        Get.back();
      },
    );
  }
}

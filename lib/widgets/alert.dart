import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showAlert(BuildContext context,
    {String header = 'Alert Dialog Title Text.',
    String body = "Are You Sure Want To Proceed ?",
    Function onYes,
    Function onNo}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(header),
        content: Text(body),
        actions: <Widget>[
          FlatButton(
            child: Text("YES"),
            onPressed: () {
              if (onYes != null) onYes();
              Navigator.of(context).pop();
            },
          ),
          FlatButton(
            child: Text("NO"),
            onPressed: () {
              if (onNo != null) onNo();
              Navigator.of(context).pop();
            },
          ),
          /*FlatButton(
            child: Text("CANCEL"),
            onPressed: () {
              //Put your code here which you want to execute on Cancel button click.
              Navigator.of(context).pop();
            },
          ),*/
        ],
      );
    },
  );
}

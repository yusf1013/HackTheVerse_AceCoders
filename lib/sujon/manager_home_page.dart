import 'package:flutter/material.dart';

class AdminHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Manager"),
        ),
        body: Center(
          child: Column(
            children: [
              RaisedButton(
                onPressed: (){},
                child: Text("give product to delivery man, count list of orders, total"),
              ),
              RaisedButton(
                onPressed: (){},
                child: Text("report about delivery man"),
              ),
              RaisedButton(
                onPressed: (){},
                child: Text("get request for absence."),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

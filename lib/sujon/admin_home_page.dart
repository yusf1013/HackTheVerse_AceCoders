import 'package:flutter/material.dart';

class AdminHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Admin"),
        ),
        body: Center(
          child: Column(
            children: [
              RaisedButton(
                onPressed: (){},
                child: Text("View report of product"),
              ),
              RaisedButton(
                onPressed: (){},
                child: Text("watch video clip"),
              ),
              RaisedButton(
                onPressed: (){},
                child: Text("View Realtime location of delivery man"),
              ),
              RaisedButton(
                onPressed: (){},
                child: Text("view last completed order"),
              ),
              RaisedButton(
                onPressed: (){},
                child: Text("view last location"),
              ),
              RaisedButton(
                onPressed: (){},
                child: Text("view absent rate of delivery man"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

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
                child: Text("give attendance"),
              ),
              RaisedButton(
                onPressed: (){},
                child: Text("Automatically start video,streaming, DetectButton press"),
              ),
              RaisedButton(
                onPressed: (){},
                child: Text("Scan QR code for reporting new agent location."),
              ),
              RaisedButton(
                onPressed: (){},
                child: Text("view nearby agents."),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

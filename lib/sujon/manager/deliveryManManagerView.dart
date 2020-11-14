import 'package:flutter/material.dart';

class DeliveryPerson extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Manager"),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                RaisedButton(
                  onPressed: (){},
                  child: Text("Total order list"),
                ),
                RaisedButton(
                  onPressed: (){},
                  child: Text("Report about DP"),
                ),
                RaisedButton(
                  onPressed: (){},
                  child: Text("Done"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

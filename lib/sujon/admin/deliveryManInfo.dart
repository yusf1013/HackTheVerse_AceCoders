import 'package:flutter/material.dart';

class DeliveryManInfo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Delivery Man"),
        ),
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: [
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

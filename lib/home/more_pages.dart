import 'package:ecommerce/domain/admin.dart';
import 'package:ecommerce/widgets/alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/model/initialize.dart';
import 'package:ecommerce/model/global_data.dart' as data;

class DpDetailPage extends StatelessWidget {
  final Delivery delivery;

  DpDetailPage(this.delivery);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${delivery.user.nickname}"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
                itemCount: delivery.totalItems.products.length,
                itemBuilder: (context, index) {
                  Product p = data.getProduct(
                      delivery.totalItems.products.keys.toList()[index]);
                  int num = delivery.totalItems.products[p.id];
                  return GestureDetector(
                    onTap: () {
                      showAlert(context,
                          header: "Damaged product",
                          body: "Report damaged product?", onYes: () {
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text("Success!"),
                        ));
                      });
                    },
                    child: Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 20,
                          child: Text((index + 1).toString()),
                          backgroundColor: Colors.white54,
                        ),
                        title: Text(p.name),
                        trailing: CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.white54,
                          child: Text("  $num" + "\npcs"),
                        ),
                      ),
                    ),
                  );
                }),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Text("Report absent"),
                color: Colors.blueAccent,
                onPressed: () {
                  data.thisManager.notifyAbsent(delivery.user.id);
                },
              ),
              SizedBox(
                width: 20,
              ),
              FlatButton(
                child: Text("Report Done"),
                color: Colors.blueAccent,
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}

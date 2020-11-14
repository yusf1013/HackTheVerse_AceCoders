import 'package:ecommerce/domain/admin.dart';
import 'package:ecommerce/home/more_pages.dart';
import 'package:ecommerce/model/global_data.dart' as data;
import 'package:ecommerce/widgets/alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/model/initialize.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ManagerHomePage();
  }
}

class ManagerHomePage extends StatefulWidget {
  @override
  _ManagerHomePageState createState() => _ManagerHomePageState();
}

class _ManagerHomePageState extends State<ManagerHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Manager"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
                itemCount: data.allUser.length,
                itemBuilder: (context, index) {
                  Delivery delivery = data.allUser[index];
                  return GestureDetector(
                    onTap: () async {
                      await Get.to(DpDetailPage(data.allUser[index]));
                      setState(() {});
                    },
                    child: Card(
                      color: delivery.done ? Colors.lightGreen : null,
                      child: ListTile(
                        title: Text(delivery.user.nickname),
                        subtitle: Text(
                            "Unnotified absence: ${delivery.unNotifiedAbsence.length}"),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}

/*class ManagerHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Manager"),
      ),
      body: ListView.builder(
          itemCount: data.allUser.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Get.to(DpDetailPage(data.allUser[index]));
              },
              child: Card(
                child: ListTile(
                  title: Text(data.allUser[index].user.nickname),
                  subtitle: Text(
                      "Unnotified absence: ${data.allUser[index].unNotifiedAbsence.length}"),
                ),
              ),
            );
          }),
    );
  }
}*/

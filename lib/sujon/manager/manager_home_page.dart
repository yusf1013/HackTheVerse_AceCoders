import 'package:ecommerce/model/global_data.dart';
import 'package:ecommerce/sujon/admin/deliveryManInfo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ManagerHomePage extends StatelessWidget {

  GlobalDataController dataController = Get.put(GlobalDataController());

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Manager"),
          actions: [
            RaisedButton(
              onPressed: () {

              },
              child: Text("Report List"),
            )
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: Obx(() =>
              ListView.builder(
                itemCount: dataController.allUsers.length,
                itemBuilder: (context, index) {
                  //return listTile(dataController.admin.reports[index].productId, dataController.admin.reports[index].reporterId, "") ;
                  return listTile(dataController.allUsers[index].user.nickname,
                      dataController.allUsers[index].user.id);
                },
              ),
          ),
        ),
      ),
    );
  }

    Widget listTile(String name, String id) {
      return InkWell(
        onTap: () => Get.to(DeliveryManInfo()),
        child: Card(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [

                  Column(
                    children: [
                      Text(name),
                      Text(id),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/global_data.dart';

class ReportList extends StatelessWidget {
  GlobalDataController controller = Get.find() ;
  int reportListLength = 5 ;
  String imagePath = "" ;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("ReportList"),),
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: Obx(()=>ListView.builder(
              itemCount: controller.admin.report.length,
              itemBuilder: (context, index){
                return listTile(controller.admin.report[index].productId, controller.admin.report[index].reporterId
                    , controller.admin.report[index].dateReported) ;
              },
            ),
          ),
        ),
      ),
    );
  }

   Widget listTile(String productId, String reporterID, String dateReported){
    return Card(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Image.network(
                imagePath,
                height: 50,
                width: 50,
              ),
              Column(
                children: [
                  Text(productId),
                  Text(reporterID),
                  Text(dateReported)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}



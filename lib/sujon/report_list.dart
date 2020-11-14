import 'package:ecommerce/model/initialize.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/global_data.dart';

class ReportList extends StatefulWidget {
  @override
  _ReportListState createState() => _ReportListState();
}

class _ReportListState extends State<ReportList> {
  GlobalDataController controller = Get.put(GlobalDataController()) ;

  @override
  void initState(){
    // TODO: implement initState
    super.initState() ;
    method() ;
  }

  method() async{
    await Initialize().initEssentials();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("ReportList"),),
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: Obx(()=>ListView.builder(
              itemCount: controller.admin.reports.length,
              itemBuilder: (context, index){
                return listTile(controller.admin.reports[index].productId, controller.admin.reports[index].reporterId, controller.admin.reports[index].dateReported) ;
              },
            ),
          ),
        ),
      ),
    );
  }

   Widget listTile(String productId, String reporterID, DateTime dateReported){
    return Card(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Image.network(
                "imagePath",
                height: 50,
                width: 50,
              ),
              Column(
                children: [
                  Text(productId),
                  Text(reporterID),
                  Text(dateReported.toString())
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}



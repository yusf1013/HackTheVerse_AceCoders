import 'package:ecommerce/model/global_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminHomePage extends StatelessWidget {
  GlobalDataController dataController = Get.find() ;

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
              ),
              Obx(()=>ListView.builder(
                itemBuilder: (context, index){
                  if(dataController.allUsers[index].type.equals("delivery")){
                    return listTile(dataController.allUsers[index].name, dataController.allUsers[index].id, dataController.allUsers[index].photoUrl) ;
                  }
                },
              ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget listTile(String name, String id, String photoUrl){
    return InkWell(
      onTap: (){

      },
      child: Card(
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
      ),
    );
  }

}

import 'package:ecommerce/domain/admin.dart';
import 'package:ecommerce/model/global_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductView extends StatelessWidget {
  GlobalDataController dataController = Get.put(GlobalDataController()) ;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Container(
          /*child: Obx(()=>
            ListView.builder(
              itemCount: dataController.delivery.totalItems.products.length,
              itemBuilder: (context, index){
                if(dataController.delivery.totalItems.products.keys.contains("1")){
                  return productCard(allProducts.) ;
                }
              },
            ),
          ),*/
        ),
      ),
    );
  }

  Widget productCard(Product product, int number){
    return InkWell(
      onTap: (){},
      child: Card(
        child: Column(
          children: [
            Row(
              children: [
                Text(product.name.toString()),
                Text(product.cost.toString()),
                Text("No")
              ],
            ),
            Row(
              children: [
                Text("Total Price: "),
              ],
            ),
            IconButton(
              icon: Icon(Icons.done),
              onPressed: (){},
            ),
          ],
        ),
      ),
    ) ;
  }
}

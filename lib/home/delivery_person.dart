import 'package:barcode_scan/barcode_scan.dart';
import 'package:ecommerce/domain/admin.dart';
import 'package:ecommerce/model/global_data.dart';
import 'package:ecommerce/widgets/alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeliveryHomePage extends StatefulWidget {
  @override
  _DeliveryHomePageState createState() => _DeliveryHomePageState();
}

class _DeliveryHomePageState extends State<DeliveryHomePage> {
  final Delivery delivery = allUser[0];
  bool check = false;
  DateTime _requestedLeaveDate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products to collect"),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: OrderView(order: delivery.totalItems),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FlatButton(
                  color: Colors.blue,
                  child: Text("Received correctly"),
                  onPressed: () {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FlatButton(
                  color: Colors.lightBlue,
                  child: Text("View all orders"),
                  onPressed: () {
                    Get.to(OrdersPage(delivery));
                  },
                ),
              ),
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 60.0),
            child: FlatButton(
              color: Colors.blue,
              child: Text(
                "Scan QR code",
                /*style: TextStyle(
                      color: Colors.black,
                    ),*/
              ),
              onPressed: () async {
                try{
                  String scanning = await BarcodeScanner.scan();
                  setState(() {
                    check = true;
                  });
                }catch(e){

                }
                if(check){
                  Get.snackbar("", "Success");
                  setState(() {
                    check = false;
                  });
                }
              },
            ),
          ),
          SizedBox(height: 10.0,),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 60.0),
            child: FlatButton(
              color: Colors.blue,
              child: Text(
                "Request Absence",
                /*style: TextStyle(
                      color: Colors.black,
                    ),*/
              ),
              onPressed: (){
                showDatePicker(context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2020),
                    lastDate: DateTime(2050)).then((date){
                   setState(() {
                     _requestedLeaveDate = date;
                     print("Date: "+_requestedLeaveDate.toString());
                   });
                });
              },
            ),
          ),
          SizedBox(height: 10.0,),
        ],
      ),
    );
  }
}

class OrderView extends StatelessWidget {
  const OrderView({
    Key key,
    @required this.order,
  }) : super(key: key);

  final Order order;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: order.products.length,
        itemBuilder: (context, index) {
          Product p = getProduct(order.products.keys.toList()[index]);
          int num = order.products[p.id];
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
        });
  }
}

class OrdersPage extends StatelessWidget {
  final Delivery delivery;

  OrdersPage(this.delivery);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Orders to deliver"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
                itemCount: delivery.getOrder().length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(SingleOrderPage(delivery.getOrder()[index]));
                    },
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.white54,
                            child: Text((index + 1).toString()),
                          ),
                          title: Text("Order number: " +
                              delivery.getOrder()[index].hashCode.toString()),
                          subtitle: Text(
                              "Number of products: ${delivery.getOrder()[index].products.length}" +
                                  "\n" +
                                  "Delivery location: ${delivery.getOrder()[index].location}"),
                        ),
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

class SingleOrderPage extends StatelessWidget {
  final Order order;

  SingleOrderPage(this.order);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products to collect"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: OrderView(order: order),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FlatButton(
                  color: Colors.blue,
                  child: Text("Received correctly"),
                  onPressed: () {},
                ),
              ),
            ],
          ),
          Container(),
        ],
      ),
    );
  }
}

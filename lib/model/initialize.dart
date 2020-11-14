import 'package:ecommerce/domain/admin.dart';
import 'package:ecommerce/domain/user.dart';
import 'package:ecommerce/model/global_data.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Initialize {
  // GlobalDataController data = Get.put(GlobalDataController());

  void initEssentials() async {
    // await initUser();
    List<Report> reportList = List();
    Report report = Report();
    report.productId = "Abc";
    report.dateReported = DateTime.now();
    //report.reporterId = "sujon";
    reportList.add(report);

    Report report2 = Report();
    report2.productId = "Abc";
    report2.dateReported = DateTime.now();
    //report2.reporterId = "sujon";
    reportList.add(report2);

    // ad.reports = reportList;

    allUser = loadDelivery();
    // initProducts();
  }

  List<Delivery> loadDelivery() {
    Delivery user1 = Delivery();
    Delivery user2 = Delivery();
    Delivery user3 = Delivery();
    List<Delivery> userList = List();

    user1.user = User();
    user1.user.nickname = "Rabiul Islam";
    user1.user.id = "1";
    user1.unNotifiedAbsence.add(DateFormat('d/M/yyyy').parse("12/11/2020"));
    user1.unNotifiedAbsence.add(DateFormat('d/M/yyyy').parse("27/08/2020"));
    for (int i = 0; i < 7; i++) {
      print(("Should have worked"));
      user1.addOrder(Order.random());
    }
    userList.add(user1);

    user2.user = User();
    user2.user.nickname = "Yusuf Ahmed";
    user2.user.id = "2";
    user2.unNotifiedAbsence.add(DateFormat('d/M/yyyy').parse("17/11/2020"));
    for (int i = 0; i < 5; i++) user2.addOrder(Order.random());

    user3.user = User();
    user3.user.nickname = "Ahmedul Kavi";
    user3.user.id = "3";
    for (int i = 0; i < 3; i++) user3.addOrder(Order.random());

    userList.add(user2);
    userList.add(user3);
    return userList;
  }
/*
  void initProducts() {
    allProducts = <Product>[
      Product(name: "Toothbrush", id: "1", cost: 25),
      Product(name: "Soap", id: "2", cost: 40),
      Product(name: "Hand sanitizer", id: "3", cost: 120),
      Product(name: "Shampoo", id: "4", cost: 320),
      Product(name: "Face wash", id: "5", cost: 450),
    ];
  }*/
}

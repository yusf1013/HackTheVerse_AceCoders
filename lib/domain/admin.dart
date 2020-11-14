import 'package:ecommerce/domain/user.dart';
import 'dart:math';
import 'package:intl/intl.dart';

import 'package:ecommerce/model/global_data.dart';

class Admin {
  List<Report> reports = List();
  List<String> unNotifiedAbsence = List();
}

class Manager {
  List<AbsenceNotice> absenceNotices = List();
  void notifyAbsent(String id) {
    var dateTime =
        DateTime.now(); // DateFormat('d/M/yyyy').parse("$date/$month/2020");
    for (Delivery d in allUser)
      if (d.user.id == id) {
        d.unNotifiedAbsence.add(dateTime);
      }
  }

  void reportDamagedProduct(String id) {
    thisAdmin.reports.add(Report(
      productId: id,
    ));
  }
}

class Delivery {
  User user;
  List<DateTime> unNotifiedAbsence = List();
  List<DateTime> requestedAbsence = List();
  Location location;
  String videoUrl;
  List<Order> _orders = List();
  Order totalItems = Order();

  Delivery({this.user});

  List<Order> getOrder() => _orders;

  void requestAbsence(int date, int month) {
    var d = DateFormat('d/M/yyyy').parse("$date/$month/2020");
    requestedAbsence.add(d);
    thisManager.absenceNotices.add(AbsenceNotice(user.id, d));
  }

  void addOrder(Order order) {
    _orders.add(order);
    print("Baal ${order.products}");
    print("${order.id}");
    if (totalItems.products == null) totalItems.products = Map();

    for (String s in order.products.keys) {
      print("Baal 2 ${totalItems.products}");

      int x = totalItems.products[s] ?? 0;
      x += order.products[s];
      if (x != 0) totalItems.products[s] = x;
    }
  }
}

class Location {
  double latitude, longitude;

  Location({this.latitude, this.longitude});
}

class Report {
  String productId;
  User user;
  DateTime dateReported;

  Report({this.productId, this.user, this.dateReported});
}

class Order {
  String id;
  Map<String, int> products = {};

  Order({this.id, this.products});

  Order.random() {
    var r = Random();
    this.id = r.nextInt(10000).toString();

    for (int i = 0; i < allProducts.length; i++) {
      int n = r.nextInt(3);
      print("Cont $n");
      if (n == 0) continue;
      this.products[allProducts[i].id] = n;
    }
  }
}

class Product {
  String name, id;
  double cost;

  Product({this.name, this.id, this.cost});

  int getSerialNumber() {
    return this.hashCode;
  }
}

class AbsenceNotice {
  String personId;
  DateTime date;

  AbsenceNotice(this.personId, this.date);
}

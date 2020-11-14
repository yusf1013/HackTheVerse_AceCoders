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
      if (d.user.id == id) d.unNotifiedAbsence.add(dateTime);
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

  void requestAbsence(int date, int month) {
    var d = DateFormat('d/M/yyyy').parse("$date/$month/2020");
    requestedAbsence.add(d);
    thisManager.absenceNotices.add(AbsenceNotice(user.id, d));
  }

  void addOrder(Order order) {
    _orders.add(order);
    for (String s in order.products.keys) {
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
  String productId, reporterId;
  DateTime dateReported;
}

class Order {
  String id;
  Map<String, int> products = Map();

  Order({this.id, this.products});

  Order.random() {
    var r = Random();
    for (int i = 0; i < allProducts.length; i++) {
      int n = r.nextInt(3);
      if (n == 0) continue;
      products[allProducts[i].id] = n;
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

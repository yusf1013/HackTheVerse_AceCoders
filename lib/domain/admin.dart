import 'package:ecommerce/domain/user.dart';

class Admin {
  List<Report> reports = List();
  List<String> unNotifiedAbsence = List();
}

class Manager {
  List<AbsenceNotice> absenceNotices = List();
}

class Delivery {
  List<DateTime> unNotifiedAbsence = List();
  List<DateTime> requestedAbsence = List();
  Location location;
  String videoUrl;
  List<Order> orders = List();
  Order totalItems = Order();
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
  Map<Product, int> products = Map();
}

class Product {
  String name, id;
  double cost;
}

class AbsenceNotice {
  String personId;
  DateTime date;
}

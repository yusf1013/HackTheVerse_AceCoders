import 'package:ecommerce/domain/user.dart';

class Admin extends User {
  List<Report> reports = List();
  List<String> unNotifiedAbsence = List();
}

class Manager extends User {}

class Delivery extends User {}

class Report {
  String productId, reporterId;
  DateTime dateReported;
}

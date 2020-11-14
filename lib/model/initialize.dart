import 'package:ecommerce/domain/admin.dart';
import 'package:ecommerce/domain/user.dart';
import 'package:ecommerce/model/global_data.dart';
import 'package:get/get.dart';

class Initialize {
  GlobalDataController data = Get.put(GlobalDataController());

  void initEssentials() async {
    // await initUser();
    List<Report> reportList = List() ;
    Report report = Report() ;
    report.productId = "Abc" ;
    report.dateReported = DateTime.now() ;
    report.reporterId = "sujon" ;
    reportList.add(report) ;

    Report report2 = Report() ;
    report2.productId = "Abc" ;
    report2.dateReported = DateTime.now() ;
    report2.reporterId = "sujon" ;
    reportList.add(report2) ;

    data.admin.reports = reportList ;

    Delivery user = Delivery() ;
    Delivery user2 = Delivery() ;
    Delivery user3 = Delivery() ;
    List<Delivery> userList = List() ;

    user.user = User() ;

    user.user.nickname = "Sujon" ;
    user.user.id = "1" ;

    user2.user = User() ;

    user2.user.nickname = "Sujon" ;
    user2.user.id = "2" ;

    user3.user = User() ;


    user3.user.nickname = "Sujon" ;
    user3.user.id = "3" ;



    userList.add(user) ;
    userList.add(user2) ;
    userList.add(user3) ;

    data.allUsers = userList ;
  }
}

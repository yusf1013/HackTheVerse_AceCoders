import 'package:ecommerce/domain/admin.dart';
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
  }
}

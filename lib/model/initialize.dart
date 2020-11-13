import 'package:ecommerce/domain/admin.dart';
import 'package:ecommerce/model/global_data.dart';
import 'package:get/get.dart';

class Initialize {
  GlobalDataController data = Get.put(GlobalDataController());

  void initEssentials() async {
    // await initUser();
  }
}

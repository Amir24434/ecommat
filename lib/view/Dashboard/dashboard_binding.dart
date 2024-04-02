import 'package:ecommat/controller/dashboard_controller.dart';
// import 'package:ecommat/controller/home_controller.dart';
import 'package:get/get.dart';

class DashBoardBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(DashBoardController());
    //  Get.put(HomeController());
  }
}

import 'package:get/get.dart';

class DashBoardController extends GetxController {
  var tabIndex = 0;

  void updateIndex(int index) {
    tabIndex = index;
    update();
  }
}

import 'package:crafty_bay/features/common/controllers/main_bottom_nav_controllers.dart';
import 'package:get/get.dart';

class ControllerBinders extends Bindings {
  @override
  void dependencies() {
    Get.put(MainBottomNavControllers());
  }
}

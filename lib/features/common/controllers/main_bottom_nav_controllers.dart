import 'package:get/get.dart';

class MainBottomNavControllers extends GetxController {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void changeIndex(int index) {
    if (index == _selectedIndex) {
      return;
    }
    _selectedIndex = index;
    update();
  }

  void moveToHome() {
    changeIndex(0);
  }

  void moveToCategories() {
    changeIndex(1);
  }
}

import 'package:crafty_bay/features/common/controllers/main_bottom_nav_controllers.dart';
import 'package:crafty_bay/features/common/ui/widgets/category_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryListScreen extends StatelessWidget {
  const CategoryListScreen({super.key});

  static const String name = "/category-list-screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.find<MainBottomNavControllers>().moveToHome();
            },
            icon: Icon(Icons.arrow_back_ios)),
        title: Text(
          "Categories",
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: GridView.builder(
        itemCount: 20,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 16, crossAxisSpacing: 8, crossAxisCount: 4),
        itemBuilder: (context, index) {
          return FittedBox(
            child: CategoryItemWidget(),
          );
        },
      ),
    );
  }
}

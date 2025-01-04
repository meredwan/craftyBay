import 'package:crafty_bay/features/common/controllers/main_bottom_nav_controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/ui/widgets/product_item_widget.dart';

class WishListScreen extends StatefulWidget {
  static const String name = '/wish-list-scree';

  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) {
        _canPop();
      },
      child: Scaffold(
        appBar: AppBar(
          leading:
              IconButton(onPressed: _canPop, icon: Icon(Icons.arrow_back_ios)),
          title: Text("wishList"),
        ),
        body: GridView.builder(
          itemCount: 20,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 0.8,
              crossAxisSpacing: 4,
              mainAxisSpacing: 4,
              crossAxisCount: 3),
          itemBuilder: (context, index) {
            return FittedBox(child: ProductItemWidget());
          },
        ),
      ),
    );
  }

  void _canPop() {
    Get.find<MainBottomNavControllers>().moveToHome();
  }
}

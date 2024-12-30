import 'package:crafty_bay/features/common/controllers/main_bottom_nav_controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../home/ui/screen/home_screen.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});
  static const String name='/main-nav-screen';

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  final List<Widget> _screens = [
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainBottomNavControllers>(
        builder: (mainBottomNavControllers) {
      return Scaffold(
        body: _screens[mainBottomNavControllers.selectedIndex],
        bottomNavigationBar: NavigationBar(
          selectedIndex: mainBottomNavControllers.selectedIndex,
          onDestinationSelected: mainBottomNavControllers.changeIndex,
          destinations: [
            NavigationDestination(
                icon: Icon(Icons.home_outlined), label: "Home"),
            NavigationDestination(
                icon: Icon(Icons.category_outlined), label: "Category"),
            NavigationDestination(
                icon: Icon(Icons.shopping_cart_outlined), label: "Cart"),
            NavigationDestination(
                icon: Icon(Icons.favorite_border), label: "wishlist"),
          ],
        ),
      );
    });
  }
}

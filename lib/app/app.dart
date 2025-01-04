import 'package:crafty_bay/app/app_theme_data.dart';
import 'package:crafty_bay/app/controller_binders.dart';
import 'package:crafty_bay/features/auth/ui/screens/otp_verification_screen.dart';
import 'package:crafty_bay/features/auth/ui/screens/splash_screen.dart';
import 'package:crafty_bay/features/auth/ui/screens/verify_email_screen.dart';
import 'package:crafty_bay/features/categoryListScreen/ui/screen/category_list_screen.dart';
import 'package:crafty_bay/features/common/ui/screens/main_bottom_nav_screen.dart';
import 'package:crafty_bay/features/product/ui/screen/product_list_screen.dart';
import 'package:crafty_bay/features/product/ui/screen/product_details_screen.dart';
import 'package:crafty_bay/features/wishlist/ui/screen/wish_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class CraftyBay extends StatelessWidget {
  const CraftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemeData.lightThemeData,
      initialBinding: ControllerBinders(),
      onGenerateRoute: (RouteSettings setting) {
        late Widget widget;
        if (setting.name == SplashScreen.name) {
          widget = SplashScreen();
        } else if (setting.name == EmailVerificationScreen.name) {
          widget = EmailVerificationScreen();
        } else if (setting.name == OtpVerificationScreen.name) {
          widget = OtpVerificationScreen();
        } else if (setting.name == MainBottomNavScreen.name) {
          widget = MainBottomNavScreen();
        } else if (setting.name == EmailVerificationScreen.name) {
          widget = EmailVerificationScreen();
        } else if (setting.name == CategoryListScreen.name) {
          widget = CategoryListScreen();
        } else if (setting.name == ProductListScreen.name) {
          String name = setting.arguments as String;
          widget = ProductListScreen(categoryName: name);
        } else if (setting.name == WishListScreen.name) {
          widget = WishListScreen();
        } else if (setting.name == ProductDetailsScreen.name) {
          int productId = setting.arguments as int;
          widget = ProductDetailsScreen(productId: productId);
        }
        return MaterialPageRoute(
          builder: (ctx) {
            return widget;
          },
        );
      },
      initialRoute: '/',
    );
  }
}

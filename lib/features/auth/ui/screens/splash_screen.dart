import 'package:crafty_bay/features/auth/ui/screens/verify_email_screen.dart';
import 'package:crafty_bay/features/common/ui/screens/main_bottom_nav_screen.dart';
import 'package:crafty_bay/features/home/ui/screen/home_screen.dart';
import 'package:flutter/material.dart';

import '../../../common/ui/widgets/app_icon_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _moveToNextScreen();
  }

  Future<void> _moveToNextScreen() async {
    await Future.delayed(Duration(seconds: 2));
    Navigator.pushReplacementNamed(context, MainBottomNavScreen.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Column(
            children: [
              Spacer(),
              AppIconWidget(),
              Spacer(),
              CircularProgressIndicator(),
              const SizedBox(
                height: 10,
              ),
              Text("Version 1.0"),
            ],
          ),
        ),
      ),
    );
  }
}

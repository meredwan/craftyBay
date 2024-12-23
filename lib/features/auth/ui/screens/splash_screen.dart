import 'package:crafty_bay/app/assets_path.dart';
import 'package:crafty_bay/features/auth/ui/screens/verify_email_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../common/widgets/app_icon_widget.dart';

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
    Navigator.pushNamed(context, EmailVerificationScreen.name);
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

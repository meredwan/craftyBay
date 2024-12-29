import 'package:crafty_bay/app/app_theme_data.dart';
import 'package:crafty_bay/features/auth/ui/screens/otp_verification_screen.dart';
import 'package:crafty_bay/features/auth/ui/screens/splash_screen.dart';
import 'package:crafty_bay/features/auth/ui/screens/verify_email_screen.dart';
import 'package:flutter/material.dart';

import '../features/auth/ui/screens/completed_profile_screen.dart';

class CraftyBay extends StatelessWidget {
  const CraftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemeData.lightThemeData,
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        EmailVerificationScreen.name: (context) => EmailVerificationScreen(),
        OtpVerificationScreen.name:(context)=>OtpVerificationScreen(),
        CompletedProfileScreen.name:(context)=>CompletedProfileScreen(),
      },
    );
  }
}

import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/features/common/widgets/app_icon_widget.dart';
import 'package:flutter/material.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  static const String name = "/email-verification";

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 80),
            AppIconWidget(),
            const SizedBox(height: 24),
            Text("Welcome Back", style: Theme.of(context).textTheme.titleLarge),
            Text("Please Enter Your Email Address",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: Colors.grey)),
            const SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(hintText: "Email Address"),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.themeColor,
                  fixedSize: Size.fromWidth(double.maxFinite),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                padding: EdgeInsets.symmetric()
              ),

              onPressed: () {},
              child: Text(
                "Next",
              ),
            )
          ],
        ),
      ),
    );
  }
}

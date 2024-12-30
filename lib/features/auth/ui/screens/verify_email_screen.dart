import 'package:crafty_bay/features/auth/ui/screens/otp_verification_screen.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import '../../../common/ui/widgets/app_icon_widget.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  static const String name = "/email-verification";

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final TextEditingController _emailController = TextEditingController();

  final GlobalKey<FormState> _fromKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _fromKey,
          child: Column(
            children: [
              const SizedBox(height: 80),
              AppIconWidget(),
              const SizedBox(height: 24),
              Text("Welcome Back",
                  style: Theme.of(context).textTheme.titleLarge),
              Text(
                "Please Enter Your Email Address",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: Colors.grey),
              ),
              const SizedBox(height: 10),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: _emailController,
                validator: (String? value) {
                  if (value!.trim().isEmpty) {
                    return "enter your email address";
                  }
                  if (EmailValidator.validate(value) == false) {
                    return "enter valid email address";
                  }
                  return null;
                },
                decoration: InputDecoration(hintText: "Email Address"),
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: () {
                  //if (_fromKey.currentState!.validate()) {}
                  Navigator.pushNamed(context, OtpVerificationScreen.name);
                },
                child: Text(
                  "Next",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

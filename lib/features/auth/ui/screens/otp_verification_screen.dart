import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/features/common/widgets/app_icon_widget.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  static const String name = "/otp-verification";

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController _otpController = TextEditingController();

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
              Text("Enter OTP Code",
                  style: Theme.of(context).textTheme.titleLarge),
              Text(
                "A 6 digit OTP code has been sent",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: Colors.grey),
              ),
              const SizedBox(height: 10),
              PinCodeTextField(
                length: 6,
                obscureText: false,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                  selectedColor: AppColors.themeColor,
                  selectedFillColor: Colors.white,
                  activeColor: AppColors.themeColor,
                  inactiveColor: AppColors.themeColor,
                  inactiveFillColor: Colors.white,
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 50,
                  fieldWidth: 40,
                  activeFillColor: Colors.white,
                ),
                keyboardType: TextInputType.number,
                animationDuration: Duration(milliseconds: 300),
                enableActiveFill: true,
                controller: _otpController,
                appContext: context,
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: () {
                  //if (_fromKey.currentState!.validate()) {}
                },
                child: Text(
                  "Next",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              RichText(
                text: TextSpan(
                    text: "This code will expire in ",
                    style: TextStyle(color: Colors.grey),
                    children: [
                      TextSpan(
                        text: "120s",
                        style: TextStyle(
                          color: AppColors.themeColor,
                        ),
                      )
                    ]),
              ),
              TextButton(onPressed: () {
                
              }, child: Text("Resend Code", style: TextStyle(color: Colors.grey),))
            ],
          ),
        ),
      ),
    );
  }
}

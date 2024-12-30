import 'dart:async';

import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/app/app_constants.dart';
import 'package:crafty_bay/features/auth/ui/screens/completed_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../common/ui/widgets/app_icon_widget.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  static const String name = "/otp-verification";

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController _otpController = TextEditingController();

  final GlobalKey<FormState> _fromKey = GlobalKey<FormState>();
  RxInt _remainingTime = AppConstants.OtpSendTimeOut.obs;
  late Timer timer;
  RxBool _resendCodeEnable = false.obs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _startResendTimer();
  }

  void _startResendTimer() {
    _resendCodeEnable.value = false;
    _remainingTime.value = AppConstants.OtpSendTimeOut;
    timer = Timer.periodic(Duration(seconds: 1), (t) {
      _remainingTime.value--;
      if (_remainingTime.value == 0) {
        t.cancel();
        _resendCodeEnable.value = true;
      }
    });
  }

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
                  Navigator.pushNamed(context, CompletedProfileScreen.name);
                },
                child: Text(
                  "Next",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Obx(
                () => Visibility(
                  visible: !_resendCodeEnable.value,
                  child: RichText(
                    text: TextSpan(
                        text: "This code will expire in ",
                        style: TextStyle(color: Colors.grey),
                        children: [
                          TextSpan(
                            text: "${_remainingTime} s",
                            style: TextStyle(
                              color: AppColors.themeColor,
                            ),
                          )
                        ]),
                  ),
                ),
              ),
              Obx(
                () => Visibility(
                  visible: _resendCodeEnable.value,
                  child: TextButton(
                      onPressed: () {
                        _startResendTimer();
                      },
                      child: Text(
                        "Resend Code",
                        style: TextStyle(color: Colors.grey),
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer.cancel();
  }
}

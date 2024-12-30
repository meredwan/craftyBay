
import 'package:flutter/material.dart';

import '../../../common/ui/widgets/app_icon_widget.dart';

class CompletedProfileScreen extends StatefulWidget {
  const CompletedProfileScreen({super.key});

  static const String name = "/completed-verification";

  @override
  State<CompletedProfileScreen> createState() =>
      _CompletedProfileScreenState();
}

class _CompletedProfileScreenState extends State<CompletedProfileScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _shippingController = TextEditingController();

  final GlobalKey<FormState> _fromKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 30),
              AppIconWidget(),
              const SizedBox(height: 20),
              Text("Completed Profile",
                  style: Theme.of(context).textTheme.titleLarge),
              Text(
                "Get Started with us with your details",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: Colors.grey),
              ),
              const SizedBox(height: 15),
              buildFrom()
            ],
          ),
        ),
      ),
    );
  }

  Form buildFrom() {
    return Form(
      key: _fromKey,
      child: Column(
                children: [
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: _firstNameController,
                    validator: (String? value) {
                      if (value!.trim().isEmpty) {
                        return "enter your first name";
                      }
                      return null;
                    },
                    decoration: InputDecoration(hintText: "First Name"),
                  ),
                  const SizedBox(height: 15,),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: _lastNameController,
                    validator: (String? value) {
                      if (value!.trim().isEmpty) {
                        return "enter your last name";
                      }
      
                      return null;
                    },
                    decoration: InputDecoration(hintText: "Last name"),
                  ),
                  const SizedBox(height: 15,),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: _mobileController,
                    validator: (String? value) {
                      if (value!.trim().isEmpty) {
                        return "enter your mobile number";
                      }
                      if(RegExp(r"^([01]|\+88)?\d{11}").hasMatch(value)==false){
                        return "enter valid mobile number";
                      }
      
                      return null;
                    },
                    decoration: InputDecoration(hintText: "Mobile"),
                  ),
                  const SizedBox(height: 15,),
                  TextFormField(
      
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: _cityController,
                    validator: (String? value) {
                      if (value!.trim().isEmpty) {
                        return "enter your city";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
      
                        hintText: "city"),
                  ),
                  const SizedBox(height: 15,),
                  TextFormField(
                    maxLines: 5,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: _shippingController,
                    validator: (String? value) {
                      if (value!.trim().isEmpty) {
                        return "enter your email address";
                      }
                      return null;
                    },
                    decoration: InputDecoration(hintText: "Shipping Address"),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_fromKey.currentState!.validate()) {}
                    },
                    child: Text(
                      "Next",
                    ),
                  ),
                ],
              ),
    );
  }
}

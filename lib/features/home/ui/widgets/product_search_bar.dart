import 'package:flutter/material.dart';

class ProductSearchBar extends StatelessWidget {
  const ProductSearchBar({
    super.key, required this.controller,
  });
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 16),
          hintText: "Search",
          filled: true,
          prefixIcon: Icon(Icons.search, color: Colors.grey,),
          fillColor: Colors.grey.shade200,
          border: OutlineInputBorder(
              borderSide: BorderSide.none
          ),enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none
      ),focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none
      ),errorBorder: OutlineInputBorder(
          borderSide: BorderSide.none
      )
      ),
    );
  }
}

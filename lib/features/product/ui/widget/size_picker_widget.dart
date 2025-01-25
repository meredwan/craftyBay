import 'package:crafty_bay/app/app_colors.dart';
import 'package:flutter/material.dart';

class ColorPickerWidget extends StatefulWidget {
  const ColorPickerWidget(
      {super.key, required this.colors, required this.onChange});

  final List<String> colors;
  final Function(String) onChange;

  @override
  State<ColorPickerWidget> createState() => _ColorPickerWidgetState();
}

class _ColorPickerWidgetState extends State<ColorPickerWidget> {
  String? _selectedColor;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        children: getColorsItem(),
      ),
    );
  }

  List<Widget> getColorsItem() {
    List<Widget> colorsList = [];
    for (String color in widget.colors) {
      colorsList.add(getColorItem(
        name: color,
        onTap: () {
          _selectedColor = color;
          widget.onChange(_selectedColor!);
          setState(() {});
        },
        isSelected: _selectedColor == color,
      ));
    }
    return colorsList;
  }

  Widget getColorItem({
    required String name,
    required VoidCallback onTap,
    required bool isSelected,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(right: 8),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(

            border: Border.all(),
            color: isSelected ? AppColors.themeColor : Colors.transparent),
        child: Text(
          name,
          style: TextStyle(color: isSelected ? Colors.white : null),
        ),
      ),
    );
  }
}

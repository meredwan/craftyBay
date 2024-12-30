import 'package:flutter/material.dart';

class AppBarIconButton extends StatelessWidget {
  const AppBarIconButton({
    super.key,
    required this.icon,
    required this.onTab,
  });

  final IconData icon;
  final VoidCallback onTab;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: CircleAvatar(
        backgroundColor: Colors.black12,
        radius: 18,
        child: Icon(
          icon,
          size: 24,
          color: Colors.black54,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class StarIcon extends StatelessWidget {
  final IconData icon;
  final double size;

  const StarIcon({super.key, required this.icon, required this.size});

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: Colors.yellow,
      size: size,
    );
  }
}

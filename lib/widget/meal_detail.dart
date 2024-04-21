import 'package:flutter/material.dart';
class MealDetail extends StatelessWidget {
  const MealDetail({super.key, required this.textIcon, required this.icon});
  final String textIcon;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon , size: 8,),
        const SizedBox(width: 8),
        Text(textIcon, style: const TextStyle(
          fontSize: 8
        ),)
      ],
    );
  }
}

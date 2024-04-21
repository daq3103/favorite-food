import 'package:flutter/material.dart';

class Category {
 final String id;
  final String title;
  final Color color;

 const Category({required this.id, required this.title,  Color? color}):  color = color ?? Colors.amber;
}

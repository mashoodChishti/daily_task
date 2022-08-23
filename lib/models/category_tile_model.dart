import 'package:flutter/material.dart';

class CategoryTile {
  String? title;
  String? description;
  String? image;
  Color? color;
  String? date;
  String? tasks;
  String? completed;
  LinearGradient? gradient;
  Function()? onTap;
  CategoryTile(
      {this.title,
      this.description,
      this.image,
      this.color,
      this.date,
      this.tasks,
      this.completed,
      this.gradient,
      this.onTap});
}

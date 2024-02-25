import 'package:flutter/material.dart';

class CategoryModel {
  int id;
  int quantity;
  String imageUrl;
  String name;
  String key;
  Color borderColor;

  CategoryModel({
    this.id = 0,
    this.quantity = 0,
    this.imageUrl = "",
    this.name = "",
    this.key = "",
    this.borderColor = Colors.transparent,
  });
}

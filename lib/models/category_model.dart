import 'package:flutter/material.dart';

class CategoryModel {
  int id;
  int quantity;
  String imageUrl;
  String name;
  Color borderColor;

  CategoryModel({
    this.id = 0,
    this.quantity = 0,
    this.imageUrl = "",
    this.name = "",
    this.borderColor = Colors.transparent,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      imageUrl: json['imageUrl'],
      name: json['name'],
    );
  }

}

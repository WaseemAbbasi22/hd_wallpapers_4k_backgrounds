import 'package:flutter/material.dart';

class CategoryModel {
  int id;
  int quantity;
  String imageUrl;
  String boxUrl;
  String tileUrl;
  String name;
  String key;
  Color borderColor;

  CategoryModel({
    this.id = 0,
    this.quantity = 0,
    this.imageUrl = "",
    this.boxUrl = "",
    this.tileUrl = "",
    this.name = "",
    this.key = "",
    this.borderColor = Colors.transparent,
  });

  @override
  String toString() {
    return 'CategoryModel{id: $id, quantity: $quantity, imageUrl: $imageUrl, boxUrl: $boxUrl, tileUrl: $tileUrl, name: $name, key: $key, borderColor: $borderColor}';
  }
}

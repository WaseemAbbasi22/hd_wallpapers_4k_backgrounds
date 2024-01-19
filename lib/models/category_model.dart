import 'package:flutter/material.dart';

class CategoryModel {
  int? id;
  String? imageUrl;
  String? name;
  Color?borderColor;

  CategoryModel(
      {this.id,
        this.imageUrl,
        this.name,
       this.borderColor
      });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      imageUrl: json['imageUrl'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "imageUrl": imageUrl,
    "name": name,
  };


}
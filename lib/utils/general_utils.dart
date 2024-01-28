import 'package:flutter/material.dart';
import 'dart:math' as math;

class GeneralUtils{
  static Color getRandomColor() {
    Color random = Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
    return random;
  }
}
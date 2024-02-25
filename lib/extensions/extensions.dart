import 'package:flutter/material.dart';

extension WidgetExtensions on Widget {
  Widget toBackDropTextContainer() {
    return IgnorePointer(
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.7),
          borderRadius: BorderRadius.circular(12),
        ),
        child: this,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class AppConstants {
  AppConstants._();

  static const Color backgroundColor = Colors.white;
  static const appBarTitleColor = Colors.orangeAccent;
  static const buttonColor = Colors.blue;

  /// style

  static TextStyle getStyle(double size, Color color) {
    return TextStyle(
      fontSize: size,
      color: color,
    );
  }
}

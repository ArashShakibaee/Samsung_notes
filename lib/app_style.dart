import 'package:flutter/material.dart';

class AppStyle {
  static TextStyle smallTextStyle = TextStyle(
      color: Colors.grey.shade700, fontFamily: "Source", fontSize: 14);
  static TextStyle normalTextStyle = TextStyle(
      color: Colors.grey.shade700, fontFamily: "Source", fontSize: 20);
  static TextStyle largeTextStyle = TextStyle(
      color: Colors.grey.shade700, fontFamily: "Source", fontSize: 25);
  static TextStyle titleTextStyle = const TextStyle(
      color: Colors.black,
      fontFamily: "Source",
      fontSize: 25,
      fontWeight: FontWeight.bold);
  static TextStyle descriptionTextStyle =
      const TextStyle(color: Colors.black, fontFamily: "Source", fontSize: 17);
}

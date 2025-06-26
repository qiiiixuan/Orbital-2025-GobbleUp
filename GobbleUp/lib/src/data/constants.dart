import 'package:flutter/material.dart';

// Constant text styles
class KTextStyle {

  // Text style for titles
  static const titleTextStyle = TextStyle(
    fontSize: 28.0,
    fontWeight: FontWeight.bold,
  );

  // Text style for normal text
  static const normalTextStyle = TextStyle(
    fontSize: 16.0,
    color: Colors.black54,
  );

  // Text style for button text
  static const buttonTextStyle = TextStyle(
    fontSize: 16.0,
  );
}


// Constant button styles
class KButtonStyle {

  // Button style for elevated buttons
  static var elevatedButtonStyle = ButtonStyle(
    foregroundColor: WidgetStatePropertyAll(Color(0xFFFFEADD)),
    backgroundColor: WidgetStatePropertyAll(Color(0xFFFF6666)),
    minimumSize: WidgetStatePropertyAll(Size(200, 50)),
  );
}
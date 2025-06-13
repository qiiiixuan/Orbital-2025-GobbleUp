import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Constant text styles
class KTextStyle {

  // Text style for titles
  static const titleTextStyle = TextStyle(
    fontSize: 30.0,
    fontWeight: FontWeight.bold,
  );

  // Text style for normal text
  static const normalTextStyle = TextStyle(
    fontSize: 10.0,
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
import 'package:flutter/material.dart';

abstract class AppButtonStyle {
  static final linkedStyle = ButtonStyle(
    foregroundColor: MaterialStateProperty.all(const Color(0xFF01B4E4)),
    textStyle: MaterialStateProperty.all(
        TextStyle(fontWeight: FontWeight.w400, fontSize: 16)
    ),
  );
}
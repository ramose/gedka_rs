import 'package:flutter/material.dart';
import 'package:gedka_rs/foundations/color_foundation.dart';
import 'package:gedka_rs/tokens/sizes.dart';

class InputBorderStyle {
  // static const borderSide = BorderSide(width: 1.0, color: ColorFoundation.activeBgColor);
  static const outlineInputBorder = OutlineInputBorder(
      borderSide: BorderSide(width: 1.0, color: Colors.grey),
      borderRadius: BorderRadius.all(Radius.circular(Sizes.cornerRadius)));
}

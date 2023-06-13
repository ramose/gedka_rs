import 'package:flutter/material.dart';

class AppColor {
  AppColor._();

  static const Color primary = Color.fromARGB(255, 0, 170, 169);
  static const Color lightPrimary = Color.fromARGB(255, 153, 228, 206);
  static const Color grey = Color.fromARGB(255, 213, 213, 213);
  static const Color white = Color.fromARGB(255, 255, 255, 255);

  static const MaterialColor mainAppColor =
      const MaterialColor(0xFF00AAA9, <int, Color>{
    50: primary,
    100: primary,
    200: primary,
    300: primary,
    400: primary,
    500: primary,
    600: primary,
    700: primary,
    800: primary,
    900: primary,
  });
}

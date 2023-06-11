import 'package:gedka_rs/foundations/color_foundation.dart';
import 'package:flutter/material.dart';

class MainIcon extends StatelessWidget {
  final bool isActive;
  final String path;
  const MainIcon({super.key, required this.isActive, required this.path});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Image.asset(
        path,
        color: isActive
            ? ColorFoundation.activeIconColor
            : ColorFoundation.disabledIconColor,
      ),
    );
  }
}

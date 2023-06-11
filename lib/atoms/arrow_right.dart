import 'package:gedka_rs/foundations/color_foundation.dart';
import 'package:flutter/material.dart';

class ArrowRight extends StatelessWidget {
  final bool isActive;
  const ArrowRight({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Image.asset(
        'assets/images/arrow-right.png',
        color: isActive ? ColorFoundation.activeIconColor : ColorFoundation.activeIconColor,
      ),
    );
  }
}

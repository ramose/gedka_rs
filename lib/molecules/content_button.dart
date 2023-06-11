import 'package:gedka_rs/atoms/arrow_right.dart';
import 'package:gedka_rs/foundations/color_foundation.dart';
import 'package:flutter/material.dart';

import '../atoms/main_icon.dart';

class ContentButton extends StatelessWidget {
  final String title;
  final bool isActive;
  final String leftIconPath;
  const ContentButton({super.key, required this.title, required this.isActive, required this.leftIconPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 80,
      color: ColorFoundation.activeButtonColor,
      child: SizedBox(
        child: Row(children: [
          leftIconPath != '' ? MainIcon(isActive: true, path: leftIconPath,) : const Text(''),
          Text(
            title,
            style: const TextStyle(color: Colors.white),
          ),
          ArrowRight(
            isActive: isActive,
          ),
        ]),
      ),
    );
  }
}

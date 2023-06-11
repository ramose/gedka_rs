import 'package:gedka_rs/atoms/arrow_right.dart';
import 'package:gedka_rs/foundations/color_foundation.dart';
import 'package:flutter/material.dart';

import '../atoms/main_icon.dart';

class MainButton extends StatelessWidget {
  final String title;
  final bool isActive;
  final VoidCallback callback;
  final String leftIconPath;
  const MainButton({super.key, required this.title, required this.isActive, required this.callback, required this.leftIconPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      color: ColorFoundation.activeButtonColor,
      child: ElevatedButton(
        onPressed: isActive ? callback : null,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: ColorFoundation.activeButtonColor,
          disabledBackgroundColor: ColorFoundation.disabledButtonColor
        ),
        child: Row(children: [
          leftIconPath != '' ? MainIcon(isActive: true, path: leftIconPath,) : const Text(''),
          Expanded(
            child: Center(
              child: Text(
                title,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
          ArrowRight(
            isActive: isActive,
          ),
        ]),
      ),
    );
  }
}

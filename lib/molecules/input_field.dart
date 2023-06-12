import 'package:gedka_rs/atoms/input_border_style.dart';
import 'package:flutter/material.dart';
import 'package:gedka_rs/foundations/color_foundation.dart';

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String errorText;
  final TextInputType type;
  const InputField(
      {super.key,
      required this.label,
      required this.errorText,
      required this.controller,
      required this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      child: TextFormField(
        controller: controller,
        cursorColor: ColorFoundation.activeBgColor,
        keyboardType: type,
        decoration: InputDecoration(
          enabledBorder: InputBorderStyle.outlineInputBorder,
          focusedBorder: InputBorderStyle.outlineInputBorder,
          errorBorder: InputBorderStyle.outlineInputBorder,
          focusedErrorBorder: InputBorderStyle.outlineInputBorder,
          labelText: label,
          labelStyle: const TextStyle(color: ColorFoundation.activeBgColor),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return errorText;
          }
          return null;
        },
        maxLines: type == TextInputType.multiline ? 3 : null,
      ),
    );
  }
}

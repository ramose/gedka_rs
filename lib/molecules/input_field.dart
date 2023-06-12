import 'package:gedka_rs/atoms/input_border_style.dart';
import 'package:flutter/material.dart';
import 'package:gedka_rs/foundations/color_foundation.dart';
import 'package:date_format/date_format.dart';

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

  // final DateTime _selectedDate = DateTime.now();

  Future<void> onShowDatePicker(context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1930, 1),
        lastDate: DateTime.now(),
    );
    if (picked != null) {
      String _datePicked = '${picked.toLocal()}'.split(' ')[0];
      controller.text = formatDate(picked, [dd, '-', mm, '-', yyyy]);
      // return '${picked}';
    }
    // return '';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      child: TextFormField(
        controller: controller,
        cursorColor: ColorFoundation.activeBgColor,
        keyboardType: type,
        onTap: () =>
            type == TextInputType.none ? onShowDatePicker(context) : {},
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

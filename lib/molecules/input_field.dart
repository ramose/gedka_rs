import 'package:gedka_rs/atoms/input_border_style.dart';
import 'package:flutter/material.dart';
import 'package:gedka_rs/foundations/color_foundation.dart';
import 'package:date_format/date_format.dart';

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String errorText;
  final TextInputType textInputType;
  final String type;
  final bool enabled;
  const InputField(
      {super.key,
      required this.label,
      required this.errorText,
      required this.controller,
      required this.type,
      required this.textInputType,
      required this.enabled});

  // final DateTime _selectedDate = DateTime.now();

  Future<void> onShowDatePicker(context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1930, 1),
        lastDate: DateTime.now(),
    );
    if (picked != null) {
      controller.text = formatDate(picked, [dd, '-', mm, '-', yyyy]);
    }
  }

  Future<void> onShowDatePickerForRegistration(context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1930, 1),
      lastDate: DateTime(DateTime.now().year, DateTime.now().month + 3),
    );
    if (picked != null) {
      controller.text = formatDate(picked, [dd, '-', mm, '-', yyyy]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      child: TextFormField(
        controller: controller,
        cursorColor: ColorFoundation.activeBgColor,
        keyboardType: textInputType,
        enabled: enabled,
        onTap:
        () {
          // type == 'date' ? () => onShowDatePicker(context) : null,
          switch(type) {
            case 'date' : onShowDatePicker(context);
            case 'registration_date' : onShowDatePickerForRegistration(context);
          }
        },

        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left:10, right:10),
          enabledBorder: InputBorderStyle.outlineInputBorder,
          focusedBorder: InputBorderStyle.outlineInputBorder,
          errorBorder: InputBorderStyle.outlineInputBorder,
          focusedErrorBorder: InputBorderStyle.outlineInputBorder,
          disabledBorder: InputBorderStyle.outlineInputBorder,
          labelText: label,
          labelStyle: const TextStyle(color: ColorFoundation.activeBgColor),
          prefixText: type == 'phone' ? '+62' : null,
          hintText: label
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

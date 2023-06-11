import 'package:gedka_rs/tokens/colors.dart';
import 'package:flutter/material.dart';
import 'package:gedka_rs/foundations/color_foundation.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class MainInputNoIcon extends StatelessWidget {
  final Key fieldKey;
  final String name;
  final String label;
  final List<Function> validators;
  const MainInputNoIcon(
      {super.key,
      required this.fieldKey,
      required this.name,
      required this.label,
      required this.validators});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.grey[50]),
      child: FormBuilderTextField(
        key: fieldKey,
        name: name,
        cursorColor: ColorFoundation.activeBgColor,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
              borderSide:
                  BorderSide(width: 0.0, color: ColorFoundation.activeBgColor),
              borderRadius: BorderRadius.zero),
          focusedBorder: const OutlineInputBorder(
              borderSide:
                  BorderSide(width: 3.0, color: ColorFoundation.activeBgColor),
              borderRadius: BorderRadius.zero),
          errorBorder: const OutlineInputBorder(
              borderSide:
                  BorderSide(width: 3.0, color: ColorFoundation.activeBgColor),
              borderRadius: BorderRadius.zero),
          focusedErrorBorder: const OutlineInputBorder(
              borderSide:
                  BorderSide(width: 3.0, color: ColorFoundation.activeBgColor),
              borderRadius: BorderRadius.zero),
          labelText: label,
          labelStyle: const TextStyle(color: ColorFoundation.activeBgColor),
        ),
        validator: FormBuilderValidators.compose(
            validators.cast<FormFieldValidator<String>>()),
      ),
    );
  }
}

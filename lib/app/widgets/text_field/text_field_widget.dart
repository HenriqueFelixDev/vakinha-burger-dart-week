import 'package:flutter/material.dart';

import '../../core/extensions/app_theme_extension.dart';

class TextFieldWidget extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final bool obscureText;
  final FormFieldValidator<String>? validator;
  
  const TextFieldWidget({
    Key? key,
    required this.label,
    this.controller,
    this.onChanged,
    this.obscureText = false,
    this.validator
  }) : super(key: key);  

  @override
  Widget build(BuildContext context) {

    final fieldBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(23.0),
      borderSide: BorderSide(color: context.appColors.border)
    );

    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        isDense: true,
        filled: true,
        fillColor: context.appColors.background,
        label: Text(label, style: context.appTextStyles.body),
        border: fieldBorder,
        enabledBorder: fieldBorder,
        focusedBorder: fieldBorder,
      ),
    );
  }
}
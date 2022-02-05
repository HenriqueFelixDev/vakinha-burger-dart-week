import 'package:flutter/material.dart';

class ShoppingCartFieldWidget extends StatelessWidget {
  final String label;
  final String hintText;
  final ValueChanged<String> onChanged;
  final FormFieldValidator<String>? validator;
  const ShoppingCartFieldWidget({
    Key? key,
    required this.label,
    required this.hintText,
    required this.onChanged,
    this.validator
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 18.0)),

        TextFormField(
          onChanged: onChanged,
          validator: validator,
          decoration: InputDecoration(
            hintText: hintText,
            border: const UnderlineInputBorder()
          )
        )
      ]
    );
  }
}
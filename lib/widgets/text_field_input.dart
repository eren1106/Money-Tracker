import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const TextFieldInput({
    required this.label,
    required this.textInputType,
    required this.textEditingController,
    this.isPass = false,
    this.rows = 1,
  });

  final String label;
  final TextInputType textInputType;
  final TextEditingController textEditingController;
  final bool isPass;
  final int rows;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(
          borderSide: BorderSide(),
        ),
      ),
      minLines: rows,
      maxLines: rows > 1 ? null : 1,
      keyboardType: textInputType,
      obscureText: isPass,
    );
  }
}

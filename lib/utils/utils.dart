import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io'; //for File

Future pickImage(ImageSource source) async {
  final image = await ImagePicker().pickImage(source: source);
  if (image == null) return;

  return File(image.path);
}

void showSnackBar(String content, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content),
    ),
  );
}

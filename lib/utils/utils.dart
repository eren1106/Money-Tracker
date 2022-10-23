import 'package:flutter/material.dart';
import 'package:fluttericon/linecons_icons.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../theme/app_theme.dart'; //for File

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

Color categoryColor(String category) {
  switch (category) {
    case 'Clothing':
      return AppTheme.colors.clothing;
    case 'Debt':
      return AppTheme.colors.dept;
    case 'Education':
      return AppTheme.colors.education;
    case 'Entertainment':
      return AppTheme.colors.entertainment;
    case 'Food':
      return AppTheme.colors.food;
    case 'Household':
      return AppTheme.colors.household;
    case 'Insurance':
      return AppTheme.colors.insurance;
    case 'Medical':
      return AppTheme.colors.medical;
    case 'Personal':
      return AppTheme.colors.personal;
    case 'Transportation':
      return AppTheme.colors.transportation;
    case 'Utilities':
      return AppTheme.colors.utilities;
    default:
      return AppTheme.colors.others;
  }
}

IconData categoryIcon(String category) {
  switch (category) {
    case 'Clothing':
      return Linecons.t_shirt;
    case 'Debt':
      return Icons.attach_money;
    case 'Education':
      return Icons.book;
    case 'Entertainment':
      return Icons.gamepad_outlined;
    case 'Food':
      return Icons.dinner_dining_rounded;
    case 'Household':
      return Icons.house;
    case 'Insurance':
      return Icons.local_atm_rounded;
    case 'Medical':
      return Icons.medical_services;
    case 'Personal':
      return Icons.co_present_rounded;
    case 'Transportation':
      return Icons.commute; //Icons.directions_car_filled_rounded
    case 'Utilities':
      return Icons.electric_bolt;
    default:
      return Icons.auto_awesome;
  }
}



import 'package:flutter/material.dart';
import 'package:kaito/core/utils/app_colors.dart';

ThemeData appTheme = ThemeData(
  primaryColor: AppColors.primary,
  secondaryHeaderColor:  AppColors.secondary,
  textSelectionTheme: const TextSelectionThemeData(
    selectionColor: AppColors.text
  ),
  dialogTheme: DialogTheme(
    backgroundColor: AppColors.dialog,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    elevation: 5,
  )
);
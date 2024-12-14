import 'package:flutter/material.dart';
import 'package:smart_way_home/utils/constants/colors.dart';

class SElevatedButtonTheme {
  SElevatedButtonTheme._();
  static ElevatedButtonThemeData elevatedButtonTheme =
      const ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(SColors.primary),
      foregroundColor: WidgetStatePropertyAll(SColors.textWhite),
    ),
  );
}

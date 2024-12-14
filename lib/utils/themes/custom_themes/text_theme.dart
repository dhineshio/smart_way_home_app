import 'package:flutter/material.dart';
import 'package:smart_way_home/utils/constants/colors.dart';

class STextTheme {
  STextTheme._();

  static TextTheme textTheme = TextTheme(
      headlineMedium: const TextStyle().copyWith(
        fontWeight: FontWeight.w500,
        color: SColors.primary,
      ),
      headlineLarge: const TextStyle().copyWith(
        fontWeight: FontWeight.w600,
      ));
}

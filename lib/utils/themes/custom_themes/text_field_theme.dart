import 'package:flutter/material.dart';
import 'package:smart_way_home/utils/constants/colors.dart';
import 'package:smart_way_home/utils/constants/sizes.dart';

class TextFieldTheme {
  TextFieldTheme._();

  static InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    border: const OutlineInputBorder(),
    labelStyle: const TextStyle(color: SColors.primary),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(SSizes.inputFieldRadius),
      borderSide: const BorderSide(color: SColors.primary, width: 2),
    ),
    contentPadding: const EdgeInsets.all(SSizes.md),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(SSizes.inputFieldRadius),
      borderSide: const BorderSide(
        color: SColors.error,
        width: 2,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(SSizes.inputFieldRadius),
      borderSide: const BorderSide(
        color: SColors.primary,
        width: 2,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(SSizes.inputFieldRadius),
      borderSide: const BorderSide(
        color: SColors.primary,
        width: 2,
      ),
    ),
  );
}

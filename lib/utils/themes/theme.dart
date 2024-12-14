import 'package:flutter/material.dart';
import 'package:smart_way_home/utils/constants/colors.dart';
import 'package:smart_way_home/utils/themes/custom_themes/elevated_button_theme.dart';
import 'package:smart_way_home/utils/themes/custom_themes/text_field_theme.dart';
import 'package:smart_way_home/utils/themes/custom_themes/text_theme.dart';

class SAppTheme {
  SAppTheme._();

  static ThemeData themeLight = ThemeData(
    fontFamily: 'Poppins',
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: SColors.primary,
    scaffoldBackgroundColor: SColors.bgLight,
    textTheme: STextTheme.textTheme,
    elevatedButtonTheme: SElevatedButtonTheme.elevatedButtonTheme,
    inputDecorationTheme: TextFieldTheme.inputDecorationTheme,
  );

  static ThemeData themeDark = ThemeData(
    fontFamily: 'Poppins',
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: SColors.primary,
    scaffoldBackgroundColor: SColors.bgDark,
  );
}

import 'package:flutter/material.dart';

class SColors {
  SColors._();

  // Basic Colors
  static const Color primary = Color(0xFF1a434e);
  // static const Color primary = Color(0xFFf16a1f);
  static const Color secondary = Color(0xFFf16a1f);
  static const Color accent = Color(0xFFf16a1f);

  // Text Colors
  static const Color textPrimary = Color(0xFF333333);
  static const Color textSecondary = Color(0xFF6C757D);
  static const Color textWhite = Colors.white;

  // Background Colors
  static const Color bgLight = Color(0xFFF6F6F6);
  static const Color bgDark = Color(0xFF272727);
  static const Color bgPrimary = Color(0xFFF3F5FF);

  // Background Container Colors
  static const Color containerLight = Color(0xFFF6F6F6);
  static Color containerDark = SColors.white.withOpacity(.1);

  // Button Colors
  static const Color btnPrimary = Color(0xFF1a434e);
  static const Color btnSecondary = Color(0xFFf16a1f);
  static const Color btnDisabled = Color(0xFFf16a1f);

  // Border Colors
  static const Color borderPrimary = Color(0xFF1a434e);
  static const Color borderSecondary = Color(0xFFf16a1f);

  //  Validation Colors
  static const Color error = Color(0xFFD32F2F);
  static const Color success = Color(0xFF388E3C);

  // Natural shades
  static const Color black = Color(0xFF232323);
  static const Color darkerGrey = Color(0xFF4F4F4F);
  static const Color darkGrey = Color(0xFF939393);
  static const Color grey = Color(0xFFE0E0E0);
  static const Color softGrey = Color(0xFFF4F4F4);
  static const Color lightGrey = Color(0xFFF9F9F9);
  static const Color white = Color(0xFFFFFFFF);
}

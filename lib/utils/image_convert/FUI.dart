import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FUI extends StatelessWidget {
  final String assetPath;
  final double? width;
  final double? height;

  const FUI(this.assetPath, {this.width = 24.0, this.height = 24.0, super.key});

  @override
  Widget build(BuildContext context) {
    if (assetPath.endsWith('.svg')) {
      return SvgPicture.asset(assetPath, width: width, height: height);
    } else {
      return Image.asset(assetPath, width: width, height: height);
    }
  }
}

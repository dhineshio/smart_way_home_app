import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_way_home/utils/constants/colors.dart';
import 'package:smart_way_home/utils/constants/sizes.dart';

class ShowProgressBar extends StatelessWidget {
  const ShowProgressBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Platform.isIOS
          ? const CupertinoActivityIndicator(
              color: SColors.textWhite,
            )
          : const SizedBox(
              height: SSizes.buttonWidth,
              child: CircularProgressIndicator(
                color: SColors.textWhite,
              ),
            ),
    );
  }
}

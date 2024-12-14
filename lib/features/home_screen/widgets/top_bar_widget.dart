import 'package:flutter/material.dart';
import 'package:smart_way_home/utils/constants/icons.dart';
import 'package:smart_way_home/utils/formatters/formatters.dart';
import 'package:smart_way_home/utils/image_convert/FUI.dart';

class TopBarWidget extends StatelessWidget {
  const TopBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text.rich(
          TextSpan(
            text: "Hello, ${SFormatters.getGreetingMessage()}",
            style: Theme.of(context).textTheme.titleMedium,
            children: [
              TextSpan(
                text: "Elon Musk",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
        const FUI(SIcons.nofication)
      ],
    );
  }
}

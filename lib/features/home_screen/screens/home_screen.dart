import 'package:flutter/material.dart';
import 'package:smart_way_home/features/home_screen/widgets/devices.dart';
import 'package:smart_way_home/features/home_screen/widgets/rooms_category.dart';
import 'package:smart_way_home/features/home_screen/widgets/top_bar_widget.dart';
import 'package:smart_way_home/utils/constants/colors.dart';
import 'package:smart_way_home/utils/constants/sizes.dart';
import 'package:smart_way_home/utils/devices/device_utils.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: SDeviceUtils.getScreenWidth(context),
          height: SDeviceUtils.getScreenHeight(),
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              const SizedBox(height: SSizes.spaceBtwItems),
              const TopBarWidget(),
              const SizedBox(height: SSizes.spaceBtwSections),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: SColors.primary.withOpacity(0.05),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: RoomsCategory(),
              ),
              const SizedBox(height: SSizes.spaceBtwItems),
              Text(
                "Devices",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: SSizes.spaceBtwItems),
              Container(
                width: double.infinity,
                height: SDeviceUtils.getScreenHeight() * 0.5,
                decoration: BoxDecoration(
                    // borderRadius: BorderRadius.circular(10),
                    // color: SColors.primary.withOpacity(0.05),
                    ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                // child: Devices(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_way_home/common/widgets/bottom_nav/controller/bottom_nav_controller.dart';
import 'package:smart_way_home/common/widgets/bottom_nav/screens/bottom_nav.dart';
import 'package:smart_way_home/features/chart_screen/screens/chart_screen.dart';
import 'package:smart_way_home/features/favourite_screen/screen/favourite_screen.dart';
import 'package:smart_way_home/features/home_screen/screens/home_screen.dart';
import 'package:smart_way_home/features/settings_screen/screens/settings_screen.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});
  BottomNavController bottomNavController = Get.put(BottomNavController());

  @override
  Widget build(BuildContext context) {
    List<Widget> navScreens = [
      HomeScreen(),
      const FavouriteScreen(),
      const ChartScreen(),
      const SettingsScreen()
    ];
    return Scaffold(
      bottomNavigationBar: BottomNav(),
      body: Obx(() {
        return navScreens[bottomNavController.selectedItem.value];
      }),
    );
  }
}

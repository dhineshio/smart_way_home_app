import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_way_home/common/widgets/bottom_nav/controller/bottom_nav_controller.dart';
import 'package:smart_way_home/utils/constants/sizes.dart';

class BottomNav extends StatelessWidget {
  BottomNav({super.key});
  BottomNavController bottomNavController = Get.put(BottomNavController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(
        SSizes.md,
        SSizes.xs,
        SSizes.md,
        SSizes.xs,
      ),
      height: SSizes.bottomNavHeight,
      child: Row(
        children: List.generate(
          4,
          (index) {
            return Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  bottomNavController.selectedItem.value = index;
                },
                child: Column(
                  children: [
                    Obx(
                      () => bottomNavController.selectedItem.value == index
                          ? bottomNavController
                              .bottomNavItems[index].filledIconAsset
                          : bottomNavController.bottomNavItems[index].iconAsset,
                    ),
                    const SizedBox(height: SSizes.bottomItemSpace),
                    Text(
                      bottomNavController.bottomNavItems[index].title,
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

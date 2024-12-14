import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_way_home/features/on_boarding/controller/on_boarding_controller.dart';
import 'package:smart_way_home/utils/constants/colors.dart';
import 'package:smart_way_home/utils/constants/sizes.dart';
import 'package:smart_way_home/utils/devices/device_utils.dart';
import 'package:smart_way_home/utils/routes/app_routes.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    final onBoardingController = OnBoardingController();
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              controller: onBoardingController.pageController,
              itemCount: onBoardingController.pagesContent.length,
              onPageChanged: (value) {
                if (value == 2) {
                  onBoardingController.isLastPage.value = true;
                } else {
                  onBoardingController.isLastPage.value = false;
                }
              },
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    SizedBox(
                      height: SDeviceUtils.getScreenHeight() * 0.20,
                    ),
                    Text(
                      onBoardingController.pagesContent[index].title,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(height: SSizes.defaultSpace),
                    SizedBox(
                      width: SDeviceUtils.getScreenWidth(context) * 0.7,
                      child: Text(
                        onBoardingController.pagesContent[index].description,
                        style: Theme.of(context).textTheme.bodySmall,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: SSizes.spaceBtwSections),
                    Image.asset(
                      onBoardingController.pagesContent[index].imageAsset,
                      width: SSizes.onBoardingSize,
                    ),
                  ],
                );
              },
            ),
            Positioned(
              bottom: 20,
              width: SDeviceUtils.getScreenWidth(context),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () {
                      Get.toNamed(SAppRoutes.mainScreen);
                    },
                    child: Text(
                      "Skip",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  SmoothPageIndicator(
                    controller: onBoardingController.pageController,
                    count: onBoardingController.pagesContent.length,
                    effect: const WormEffect(
                      dotWidth: 10.0,
                      dotHeight: 10.0,
                      activeDotColor: SColors.primary,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (!onBoardingController.isLastPage.value) {
                        onBoardingController.pageController.nextPage(
                          duration: 200.milliseconds,
                          curve: Curves.easeIn,
                        );
                      } else {
                        Get.offNamed(SAppRoutes.mainScreen);
                      }
                    },
                    child: Obx(
                      () => onBoardingController.isLastPage.value
                          ? const Text("Start")
                          : const Text("Next"),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_way_home/features/on_boarding/models/page_content_model.dart';
import 'package:smart_way_home/utils/constants/images.dart';
import 'package:smart_way_home/utils/constants/text.dart';

class OnBoardingController extends GetxController {
  final isLastPage = false.obs;
  final List<PageContentModel> pagesContent = [
    PageContentModel(
        title: SText.onBoardingTitle1,
        description: SText.onBoardingDescription1,
        imageAsset: SImages.onBoarding1),
    PageContentModel(
        title: SText.onBoardingTitle2,
        description: SText.onBoardingDescription2,
        imageAsset: SImages.onBoarding2),
    PageContentModel(
        title: SText.onBoardingTitle3,
        description: SText.onBoardingDescription3,
        imageAsset: SImages.onBoarding3),
  ];

  final pageController = PageController();
}

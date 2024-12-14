import 'package:get/get.dart';
import 'package:smart_way_home/common/widgets/bottom_nav/models/nav_item_model.dart';
import 'package:smart_way_home/utils/constants/icons.dart';
import 'package:smart_way_home/utils/constants/text.dart';
import 'package:smart_way_home/utils/image_convert/FUI.dart';

class BottomNavController extends GetxController {
  final selectedItem = 0.obs;

  List<NavItemModel> bottomNavItems = [
    NavItemModel(
      iconAsset: const FUI(SIcons.bottomNavIcon1),
      filledIconAsset: const FUI(SIcons.bottomNavIconFill1),
      title: SText.bottomNavLabel1,
    ),
    NavItemModel(
      iconAsset: const FUI(SIcons.bottomNavIcon2),
      filledIconAsset: const FUI(SIcons.bottomNavIconFill2),
      title: SText.bottomNavLabel2,
    ),
    NavItemModel(
      iconAsset: const FUI(SIcons.bottomNavIcon3),
      filledIconAsset: const FUI(SIcons.bottomNavIconFill3),
      title: SText.bottomNavLabel3,
    ),
    NavItemModel(
      iconAsset: const FUI(SIcons.bottomNavIcon4),
      filledIconAsset: const FUI(SIcons.bottomNavIconFill4),
      title: SText.bottomNavLabel4,
    ),
  ];
}

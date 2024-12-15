import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_way_home/features/home_screen/controllers/rooms_controller.dart';
import 'package:smart_way_home/features/home_screen/widgets/device_add_bs.dart';
import 'package:smart_way_home/features/home_screen/widgets/devices.dart';
import 'package:smart_way_home/features/home_screen/widgets/rooms_category.dart';
import 'package:smart_way_home/features/home_screen/widgets/top_bar_widget.dart';
import 'package:smart_way_home/utils/constants/colors.dart';
import 'package:smart_way_home/utils/constants/sizes.dart';
import 'package:smart_way_home/utils/devices/device_utils.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final RoomsController _controller = Get.put(RoomsController());

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
              // ! Devices
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Devices",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_controller.roomInfo1.isEmpty ||
                          _controller.selectedRoom.value == 0) {
                        Get.snackbar(
                          "Add Required",
                          snackPosition: SnackPosition.BOTTOM,
                          "Please Select or Add a Room First",
                          backgroundColor: SColors.error,
                          colorText: SColors.textWhite,
                          duration: 1500.milliseconds,
                        );
                        return;
                      }
                      showModalBottomSheet(
                        context: context,
                        showDragHandle: true,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (context) => DeviceAddBs(),
                      );
                      // getIt<AddNewDeviceUseCase>().call(
                      //   AddDeviceReqModel(
                      //     roomId: 2,
                      //     name: 'fan',
                      //     type: 'fan',
                      //   ),
                      // );
                    },
                    child: const Text("+ Add Device"),
                  )
                ],
              ),
              const SizedBox(height: SSizes.spaceBtwItems),
              Container(
                width: double.infinity,
                height: SDeviceUtils.getScreenHeight() * 0.46,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Devices(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

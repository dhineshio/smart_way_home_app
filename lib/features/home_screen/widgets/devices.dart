import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_way_home/features/home_screen/controllers/rooms_controller.dart';
import 'package:smart_way_home/features/home_screen/models/DeviceData.dart';
import 'package:smart_way_home/utils/constants/colors.dart';
import 'package:smart_way_home/utils/constants/icons.dart';
import 'package:smart_way_home/utils/image_convert/FUI.dart';

class Devices extends StatelessWidget {
  Devices({super.key});
  final RoomsController _controller = Get.put(RoomsController());

  @override
  Widget build(BuildContext context) {
    final colors = [
      Color(0xff9789C8),
      Color(0xff7FB9C1),
      Color(0xffC99D6C),
      Color(0xffD9917C),
    ];

    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Obx(
            () {
              return GridView.builder(
                itemCount: _controller.filteredDeviceList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: colors[index % colors.length].withOpacity(.3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const FUI(
                          SIcons.passwordIcon,
                          width: 40,
                          height: 40,
                        ),
                        Text(
                          _controller.filteredDeviceList[index].deviceName,
                          // devices[index].deviceName,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Switch(
                          value:
                              _controller.filteredDeviceList[index].isActive!,
                          onChanged: (value) {},
                          activeColor: colors[index % colors.length],
                          activeTrackColor: SColors.white,
                          inactiveTrackColor:
                              colors[index % colors.length].withOpacity(.03),
                          inactiveThumbColor: colors[index % colors.length],
                          trackOutlineColor: WidgetStateProperty.all(
                            (_controller.filteredDeviceList[index].isActive ??
                                    false)
                                ? SColors.white
                                : colors[index % colors.length],
                          ),
                        )
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

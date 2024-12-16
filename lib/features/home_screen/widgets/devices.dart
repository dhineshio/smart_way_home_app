import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:smart_way_home/features/home_screen/bloc/rooms_bloc.dart';
import 'package:smart_way_home/features/home_screen/controllers/rooms_controller.dart';
import 'package:smart_way_home/utils/constants/colors.dart';
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
                        FUI(
                          _controller.filteredDeviceList[index].deviceIcon,
                          width: 40,
                          height: 40,
                        ),
                        Text(
                          _controller.filteredDeviceList[index].deviceName,
                          // devices[index].deviceName,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        BlocConsumer<RoomsBloc, RoomsState>(
                          listener: (context, state) {
                            if (state is ControlSuccessState) {
                              _controller.updateDeviceStatus(index, true);
                              Get.snackbar(
                                "Success",
                                snackPosition: SnackPosition.BOTTOM,
                                state.response,
                                backgroundColor: SColors.success,
                                colorText: SColors.textWhite,
                                duration: 800.milliseconds,
                              );
                            }
                            if (state is ControlFailureState) {
                              _controller.updateDeviceStatus(index, false);
                              Get.snackbar(
                                "Failed",
                                snackPosition: SnackPosition.BOTTOM,
                                state.error,
                                backgroundColor: SColors.error,
                                colorText: SColors.textWhite,
                                duration: 1500.milliseconds,
                              );
                            }
                          },
                          builder: (context, state) {
                            return Switch(
                              value: _controller
                                  .filteredDeviceList[index].isActive!,
                              onChanged: (value) {
                                var deviceName = _controller
                                    .filteredDeviceList[index].deviceName;
                                var esp32Ip = _controller
                                    .filteredDeviceList[index].roomEsp32Ip;
                                context.read<RoomsBloc>().add(
                                      ControlDeviceEvent(
                                        deviceName: deviceName,
                                        esp32Ip: esp32Ip,
                                        status: value,
                                      ),
                                    );
                                _controller.updateDeviceStatus(index, value);
                              },
                              activeColor: colors[index % colors.length],
                              activeTrackColor: SColors.white,
                              inactiveTrackColor: colors[index % colors.length]
                                  .withOpacity(.03),
                              inactiveThumbColor: colors[index % colors.length],
                              trackOutlineColor: WidgetStateProperty.all(
                                (_controller.filteredDeviceList[index]
                                            .isActive ??
                                        false)
                                    ? SColors.white
                                    : colors[index % colors.length],
                              ),
                            );
                          },
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

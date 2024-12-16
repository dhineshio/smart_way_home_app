import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:smart_way_home/features/home_screen/bloc/rooms_bloc.dart';
import 'package:smart_way_home/features/home_screen/controllers/rooms_controller.dart';
import 'package:smart_way_home/features/home_screen/models/local/device_icon_model.dart';
import 'package:smart_way_home/features/home_screen/models/new/add_device_req_model.dart';
import 'package:smart_way_home/features/home_screen/models/new/device_info_model.dart';
import 'package:smart_way_home/features/home_screen/usecase/add_new_device_use_case.dart';
import 'package:smart_way_home/utils/constants/colors.dart';
import 'package:smart_way_home/utils/constants/icons.dart';
import 'package:smart_way_home/utils/constants/sizes.dart';
import 'package:smart_way_home/utils/devices/device_utils.dart';
import 'package:smart_way_home/utils/image_convert/FUI.dart';
import 'package:smart_way_home/utils/service_locator/service_locator.dart';

class DeviceAddBs extends StatelessWidget {
  DeviceAddBs({super.key});
  final RoomsController _controller = Get.put(RoomsController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SDeviceUtils.getScreenWidth(context),
      height: SDeviceUtils.getScreenHeight() * 0.65,
      color: SColors.containerLight,
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              children: [
                Text(
                  "Add a Devices",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: SSizes.spaceBtwSections),
                // ! Choosing Devices
                Expanded(
                  child: Obx(
                    () {
                      return GridView.builder(
                        itemCount: _controller.deviceList.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 0,
                          crossAxisCount: 4,
                        ),
                        itemBuilder: (context, index) {
                          final deviceList = _controller.deviceList;
                          return GestureDetector(
                            onTap: () =>
                                _controller.toggleDeviceSelection(index),
                            child: Stack(
                              children: [
                                SizedBox(
                                  height: 300,
                                  width: 80,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 50,
                                        width: 50,
                                        padding: const EdgeInsets.all(15),
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: SColors.grey,
                                        ),
                                        child: FUI(deviceList[index].iconId),
                                      ),
                                      // spaceSmall,
                                      const SizedBox(height: 5),
                                      Text(
                                        deviceList[index].deviceName,
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall!
                                            .copyWith(fontSize: 10),
                                      ),
                                    ],
                                  ),
                                ),
                                _controller.deviceList[index].isClicked!
                                    ? Positioned(
                                        right: 20,
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            color: SColors.success,
                                            shape: BoxShape.circle,
                                          ),
                                          child: const Icon(
                                            Icons.check,
                                            color: SColors.white,
                                            size: 18,
                                          ),
                                        ),
                                      )
                                    : const SizedBox.shrink(),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: SDeviceUtils.getScreenWidth(context),
            height: 50,
            child: BlocConsumer<RoomsBloc, RoomsState>(
              listener: (context, state) {
                if (state is AddDeviceSuccessState) {
                  var roomId = _controller.selectedRoom.value;
                  var esp32Ip = _controller.selectedRoomEspIp.value;
                  var deviceId = state.response['id'];
                  var deviceName = state.response['name'];
                  var deviceType = state.response['type'];
                  var status = state.response['status'];
                  var deviceIcon = _controller.deviceList
                      .firstWhere(
                        (item) => item.isClicked ?? false,
                        orElse: () => DeviceIconModel(
                          deviceId: 0,
                          deviceName: 'None',
                          deviceType: 'None',
                          iconId: SIcons.passwordIcon,
                        ),
                      )
                      .iconId;

                  _controller.deviceInfo.add(
                    DeviceInfoModel(
                      roomId: roomId,
                      deviceId: deviceId,
                      deviceIcon: deviceIcon,
                      deviceName: deviceName,
                      deviceType: deviceType,
                      isActive: status,
                      roomEsp32Ip: esp32Ip,
                    ),
                  );
                  _controller.filterDevicesByRoomId(roomId);

                  Get.back();
                  Get.snackbar(
                    "Success",
                    snackPosition: SnackPosition.TOP,
                    "$deviceName has added",
                    backgroundColor: SColors.success,
                    colorText: SColors.textWhite,
                    duration: 800.milliseconds,
                  );
                }
                if (state is AddDeviceFailureState) {
                  Get.snackbar(
                    "Failed",
                    state.error,
                    backgroundColor: SColors.error,
                    colorText: SColors.textWhite,
                    duration: 800.milliseconds,
                  );
                }
              },
              builder: (context, state) {
                return ElevatedButton(
                  onPressed: () {
                    var roomId = _controller.selectedRoom.value;
                    var deviceName = _controller.deviceList
                        .firstWhere(
                          (item) => item.isClicked ?? false,
                          orElse: () => DeviceIconModel(
                            deviceId: 0,
                            deviceName: 'None',
                            deviceType: 'None',
                            iconId: SIcons.passwordIcon,
                          ),
                        )
                        .deviceName;
                    var deviceType = _controller.deviceList
                        .firstWhere(
                          (item) => item.isClicked ?? false,
                          orElse: () => DeviceIconModel(
                            deviceId: 0,
                            deviceName: 'None',
                            deviceType: 'None',
                            iconId: SIcons.passwordIcon,
                          ),
                        )
                        .deviceType;

                    context.read<RoomsBloc>().add(
                          AddDeviceEvent(
                            roomId: roomId,
                            deviceName: deviceName,
                            deviceType: deviceType,
                          ),
                        );
                    // getIt<AddNewDeviceUseCase>().call(
                    //   AddDeviceReqModel(
                    //     roomId: roomId,
                    //     name: deviceName,
                    //     type: deviceType,
                    //   ),
                    // );
                  },
                  child: const Text("Add a Device"),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

//     roomId: 2,
//     name: 'fan',
//     type: 'fan',
//   ),

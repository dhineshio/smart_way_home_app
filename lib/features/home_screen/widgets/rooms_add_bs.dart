import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:smart_way_home/features/home_screen/bloc/rooms_bloc.dart';
import 'package:smart_way_home/features/home_screen/controllers/rooms_controller.dart';
import 'package:smart_way_home/features/home_screen/models/local/room_icon_model.dart';
import 'package:smart_way_home/features/home_screen/models/new/add_room_new_model.dart';
import 'package:smart_way_home/features/home_screen/models/new/rooms_info_model.dart';
import 'package:smart_way_home/features/home_screen/usecase/add_room_new_use_case.dart';
import 'package:smart_way_home/utils/constants/colors.dart';
import 'package:smart_way_home/utils/constants/icons.dart';
import 'package:smart_way_home/utils/constants/sizes.dart';
import 'package:smart_way_home/utils/devices/device_utils.dart';
import 'package:smart_way_home/utils/image_convert/FUI.dart';
import 'package:smart_way_home/utils/service_locator/service_locator.dart';

class RoomsAddBs extends StatelessWidget {
  RoomsAddBs({super.key});
  final RoomsController _controller = Get.put(RoomsController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SDeviceUtils.getScreenWidth(context),
      height: SDeviceUtils.getScreenHeight() * 0.65,
      color: SColors.containerLight,
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Text(
            "Add a Rooms",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: SSizes.spaceBtwSections),
          TextField(
            decoration: const InputDecoration(
              hintText: "192.168.0.1",
              hintStyle: TextStyle(color: SColors.grey),
            ),
            controller: _controller.esp32IpController,
            focusNode: _controller.esp32IpFocusNode,
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: SSizes.spaceBtwSections),
          Expanded(
            child: Obx(() {
              return GridView.builder(
                itemCount: _controller.roomsIconList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 0,
                  crossAxisCount: 4,
                ),
                itemBuilder: (context, index) {
                  final roomIconList = _controller.roomsIconList;
                  return GestureDetector(
                    onTap: () => _controller.toggleSelection(index),
                    child: Stack(
                      children: [
                        SizedBox(
                          height: 300,
                          width: 80,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                padding: const EdgeInsets.all(15),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: SColors.grey,
                                ),
                                child: FUI(roomIconList[index].icon),
                              ),
                              // spaceSmall,
                              const SizedBox(height: 5),
                              Text(
                                roomIconList[index].title,
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall!
                                    .copyWith(fontSize: 10),
                              ),
                            ],
                          ),
                        ),
                        _controller.roomsIconList[index].isSelected!
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
            }),
          ),
          SizedBox(
            width: SDeviceUtils.getScreenWidth(context),
            height: 50,
            child: BlocConsumer<RoomsBloc, RoomsState>(
              listener: (context, state) {
                if (state is AddRoomsFailureState) {}
                if (state is AddRoomsNewSuccessState) {
                  var roomId = state.response['id'];
                  var iconId = _controller.clickedIcon.value;
                  var roomName = state.response['name'];
                  _controller.roomInfo1.add(RoomsInfoModel(
                    roomId: roomId,
                    iconId: iconId,
                    roomName: roomName,
                  ));
                  Get.back();
                  Get.snackbar(
                    "Success",
                    snackPosition: SnackPosition.TOP,
                    "${state.response['name']} has added",
                    backgroundColor: SColors.success,
                    colorText: SColors.textWhite,
                    duration: 800.milliseconds,
                  );
                }
                if (state is AddRoomsNewFailureState) {
                  Get.snackbar(
                    "Failed",
                    state.error,
                    backgroundColor: SColors.error,
                    colorText: SColors.textWhite,
                    duration: 800.milliseconds,
                  );
                }
                if (state is AddRoomsSuccessState) {
                  _controller.roomsBloc.add(GetRoomsEvent());
                  Get.back();
                }
                if (state is RoomsLoadingState) {}
              },
              builder: (context, state) {
                return ElevatedButton(
                  onPressed: () {
                    var roomName = _controller.roomsIconList
                        .firstWhere(
                          (item) => item.isSelected ?? false,
                          orElse: () => RoomIconModel(
                              id: 100,
                              title: "None",
                              icon: SIcons.passwordIcon),
                        )
                        .title;
                    var iconId = _controller.roomsIconList
                        .firstWhere(
                          (item) => item.isSelected ?? false,
                          orElse: () => RoomIconModel(
                            id: 100,
                            title: "None",
                            icon: SIcons.passwordIcon,
                          ),
                        )
                        .id;
                    // context.read<RoomsBloc>().add(
                    //       AddRoomsEvent(iconId: iconId.toString()),
                    //     );
                    if (roomName == "None" || iconId == 100) {
                      print("None has selected");
                      return;
                    }
                    _controller.clickedIcon.value = iconId;
                    // print(iconId);
                    // print(_controller.esp32IpController.text);
                    context.read<RoomsBloc>().add(
                          AddRoomsNewEvent(
                            roomName: roomName,
                            esp32Ip: _controller.esp32IpController.text,
                          ),
                        );
                    // getIt<AddRoomNewUseCase>().call(AddRoomNewModel(
                    //   name: roomName,
                    //   esp32Ip: _controller.esp32IpController.text,
                    // ));
                  },
                  child: const Text("+ Add"),
                );
              },
            ),
          ),
          const SizedBox(height: SSizes.defaultSpace),
        ],
      ),
    );
  }
}

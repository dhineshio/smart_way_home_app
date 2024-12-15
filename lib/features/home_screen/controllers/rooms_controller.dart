import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_way_home/features/home_screen/bloc/rooms_bloc.dart';
import 'package:smart_way_home/features/home_screen/models/local/device_icon_model.dart';
import 'package:smart_way_home/features/home_screen/models/local/room_icon_model.dart';
import 'package:smart_way_home/features/home_screen/models/new/rooms_info_model.dart';
import 'package:smart_way_home/utils/constants/icons.dart';
import 'package:smart_way_home/utils/service_locator/service_locator.dart';

class RoomsController extends GetxController {
  final isUpdating = false.obs;
  final RoomsBloc roomsBloc = getIt<RoomsBloc>();
  final clickedIcon = 100.obs;
  final iconsId = [].obs;
  final roomId = [].obs;
  var roomInfo1 = <RoomsInfoModel>[].obs;
  var selectedRoom = 0.obs;

  final roomInfo = [
    RoomIconModel(
      id: 1,
      title: "Hall",
      icon: SIcons.roomHall,
      isSelected: true,
    ),
    RoomIconModel(
      id: 2,
      title: "BedRoom",
      icon: SIcons.roomBedRoom,
      isSelected: false,
    ),
    RoomIconModel(
      id: 3,
      title: "Kitchen",
      icon: SIcons.roomKitchen,
      isSelected: false,
    ),
    RoomIconModel(
        id: 4,
        title: "LivingRoom",
        icon: SIcons.roomLivingRoom,
        isSelected: false),
    RoomIconModel(
        id: 5, title: "BathRoom", icon: SIcons.roomBathRoom, isSelected: false),
    RoomIconModel(
        id: 6,
        title: "StudyRoom",
        icon: SIcons.roomStudyRoom,
        isSelected: false),
    RoomIconModel(
        id: 7,
        title: "DiningRoom",
        icon: SIcons.roomDiningRoom,
        isSelected: false),
    RoomIconModel(
        id: 8,
        title: "GuestRoom",
        icon: SIcons.roomGuestRoom,
        isSelected: false),
    RoomIconModel(
        id: 9, title: "KidsRoom", icon: SIcons.roomKidsRoom, isSelected: false),
    RoomIconModel(
      id: 10,
      title: "Balcany",
      icon: SIcons.roomBalcany,
      isSelected: false,
    )
  ].obs;

  final roomsIconList = [
    RoomIconModel(
      id: 101,
      title: "Hall",
      icon: SIcons.roomHall,
      isSelected: false,
    ),
    RoomIconModel(
      id: 102,
      title: "BedRoom",
      icon: SIcons.roomBedRoom,
      isSelected: false,
    ),
    RoomIconModel(
      id: 103,
      title: "Kitchen",
      icon: SIcons.roomKitchen,
      isSelected: false,
    ),
    RoomIconModel(
        id: 104,
        title: "LivingRoom",
        icon: SIcons.roomLivingRoom,
        isSelected: false),
    RoomIconModel(
        id: 105,
        title: "BathRoom",
        icon: SIcons.roomBathRoom,
        isSelected: false),
    RoomIconModel(
        id: 106,
        title: "StudyRoom",
        icon: SIcons.roomStudyRoom,
        isSelected: false),
    RoomIconModel(
        id: 107,
        title: "DiningRoom",
        icon: SIcons.roomDiningRoom,
        isSelected: false),
    RoomIconModel(
        id: 108,
        title: "GuestRoom",
        icon: SIcons.roomGuestRoom,
        isSelected: false),
    RoomIconModel(
        id: 109,
        title: "KidsRoom",
        icon: SIcons.roomKidsRoom,
        isSelected: false),
    RoomIconModel(
      id: 110,
      title: "Balcany",
      icon: SIcons.roomBalcany,
      isSelected: false,
    )
  ].obs;

  final roomList = {
    101: [SIcons.roomHall, "Hall"],
    102: [SIcons.roomBedRoom, "BedRoom"],
    103: [SIcons.roomKitchen, "Kitchen"],
    104: [SIcons.roomLivingRoom, "LivingRoom"],
    105: [SIcons.roomBathRoom, "BathRoom"],
    106: [SIcons.roomStudyRoom, "StudyRoom"],
    107: [SIcons.roomDiningRoom, "DinningRoom"],
    108: [SIcons.roomGuestRoom, "GuestRoom"],
    109: [SIcons.roomKidsRoom, "KidsRoom"],
    110: [SIcons.roomBalcany, "Balcany"]
  };

  final deviceList = [
    DeviceIconModel(
      deviceId: 101,
      deviceName: "Light-1",
      deviceType: "None",
      iconId: SIcons.roomHall,
      isClicked: false,
    ),
    DeviceIconModel(
      deviceId: 102,
      deviceName: "Light-2",
      deviceType: "None",
      iconId: SIcons.roomHall,
      isClicked: false,
    ),
    DeviceIconModel(
      deviceId: 103,
      deviceName: "Light-3",
      deviceType: "None",
      iconId: SIcons.roomHall,
      isClicked: false,
    ),
    DeviceIconModel(
      deviceId: 104,
      deviceName: "Light-4",
      deviceType: "None",
      iconId: SIcons.roomHall,
      isClicked: false,
    ),
    DeviceIconModel(
      deviceId: 105,
      deviceName: "Light",
      deviceType: "None",
      iconId: SIcons.roomHall,
      isClicked: false,
    ),
  ].obs;

  final TextEditingController esp32IpController = TextEditingController();
  final FocusNode esp32IpFocusNode = FocusNode();

  void resetSelection() {
    for (var room in roomsIconList) {
      room.isSelected = false;
    }
    roomsIconList.refresh();
  }

  void toggleRoomSelection(int index) {
    // print(roomInfo1[index].roomId);
    selectedRoom = roomInfo1[index].roomId.obs;
    print("Selecrtedd room : $selectedRoom");
    for (int i = 0; i < roomInfo1.length; i++) {
      roomInfo1[i].isActive = i == index;
    }
    roomInfo1.refresh();
  }

  void toggleSelection(int index) {
    for (int i = 0; i < roomsIconList.length; i++) {
      roomsIconList[i].isSelected = i == index;
    }
    roomsIconList.refresh();
  }

  void toggleDeviceSelection(int index) {
    for (int i = 0; i < deviceList.length; i++) {
      deviceList[i].isClicked = i == index;
    }
    deviceList.refresh();
  }

  @override
  void onInit() {
    super.onInit();
    // roomsBloc.add(GetRoomsEvent());
  }

  @override
  void onClose() {
    roomsBloc.close();
    super.onClose();
  }
}

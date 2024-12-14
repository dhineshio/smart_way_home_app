import 'package:get/get.dart';
import 'package:smart_way_home/features/home_screen/bloc/rooms_bloc.dart';
import 'package:smart_way_home/features/home_screen/models/local/room_icon_model.dart';
import 'package:smart_way_home/utils/constants/icons.dart';
import 'package:smart_way_home/utils/service_locator/service_locator.dart';

class RoomsController extends GetxController {
  final isUpdating = false.obs;
  final RoomsBloc roomsBloc = getIt<RoomsBloc>();
  final iconsId = [].obs;
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

  void resetSelection() {
    for (var room in roomsIconList) {
      room.isSelected = false;
    }
    roomsIconList.refresh();
  }

  void toggleSelection(int index) {
    for (int i = 0; i < roomsIconList.length; i++) {
      roomsIconList[i].isSelected = i == index;
    }
    roomsIconList.refresh();
  }

  @override
  void onInit() {
    super.onInit();
    roomsBloc.add(GetRoomsEvent());
  }

  @override
  void onClose() {
    roomsBloc.close();
    super.onClose();
  }
}

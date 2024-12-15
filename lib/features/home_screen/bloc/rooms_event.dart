part of 'rooms_bloc.dart';

abstract class RoomsEvent {}

class AddRoomsEvent extends RoomsEvent {
  final String iconId;
  AddRoomsEvent({required this.iconId});
}

class AddRoomsNewEvent extends RoomsEvent {
  final String roomName;
  final String esp32Ip;
  AddRoomsNewEvent({required this.roomName, required this.esp32Ip});
}

class AddDeviceEvent extends RoomsEvent {
  final int roomId;
  final String deviceName;
  final String deviceType;

  AddDeviceEvent({
    required this.roomId,
    required this.deviceName,
    required this.deviceType,
  });
}

class GetRoomsEvent extends RoomsEvent {}

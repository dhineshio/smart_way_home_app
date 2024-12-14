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

class GetRoomsEvent extends RoomsEvent {}

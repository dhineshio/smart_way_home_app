part of 'rooms_bloc.dart';

abstract class RoomsEvent {}

class AddRoomsEvent extends RoomsEvent {
  final String iconId;
  AddRoomsEvent({required this.iconId});
}

class GetRoomsEvent extends RoomsEvent {}

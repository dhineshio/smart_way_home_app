part of 'rooms_bloc.dart';

abstract class RoomsState {}

class RoomsInitialState extends RoomsState {}

class RoomsLoadingState extends RoomsState {}

class AddRoomsSuccessState extends RoomsState {
  final String response;
  AddRoomsSuccessState({required this.response});
}

class AddRoomsFailureState extends RoomsState {
  final String error;
  AddRoomsFailureState({required this.error});
}

class AddRoomsNewSuccessState extends RoomsState {
  final Map<String, dynamic> response;
  AddRoomsNewSuccessState({required this.response});
}

class AddRoomsNewFailureState extends RoomsState {
  final String error;
  AddRoomsNewFailureState({required this.error});
}

class AddDeviceSuccessState extends RoomsState {
  final Map<String, dynamic> response;
  AddDeviceSuccessState({required this.response});
}

class AddDeviceFailureState extends RoomsState {
  final String error;
  AddDeviceFailureState({required this.error});
}

class GetRoomsSuccessState extends RoomsState {
  final List<dynamic> response;
  GetRoomsSuccessState({required this.response});
}

class GetRoomsFailureState extends RoomsState {
  final String error;
  GetRoomsFailureState({required this.error});
}

class DeviceStatusChangedSuccessState extends RoomsState {
  final String response;
  DeviceStatusChangedSuccessState({required this.response});
}

class DeviceStatusChangedFailureState extends RoomsState {
  final String error;
  DeviceStatusChangedFailureState({required this.error});
}

class ControlSuccessState extends RoomsState {
  final String response;
  ControlSuccessState({required this.response});
}

class ControlFailureState extends RoomsState {
  final String error;
  ControlFailureState({required this.error});
}

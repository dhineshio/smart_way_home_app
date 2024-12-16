import 'package:fpdart/src/either.dart';
import 'package:smart_way_home/data/services/api_services.dart';
import 'package:smart_way_home/features/home_screen/models/add_rooms_model.dart';
import 'package:smart_way_home/features/home_screen/models/new/add_device_req_model.dart';
import 'package:smart_way_home/features/home_screen/models/new/add_room_new_model.dart';
import 'package:smart_way_home/features/home_screen/models/new/control_device_req_model.dart';
import 'package:smart_way_home/features/home_screen/models/new/device_control_req_model.dart';
import 'package:smart_way_home/utils/service_locator/service_locator.dart';

abstract class RoomRepo {
  Future<Either> addRooms(AddRoomsModel addRoomModel);
  Future<Either> getRooms(String token);
  Future<Either> addRoomsNew(AddRoomNewModel addDeviceNewModel);
  Future<Either> addNewDevice(AddDeviceReqModel addDeviceReqModel);
  Future<Either> changeDeviceStatus(
      DeviceControlReqModel deviceControlReqModel);
  Future<Either> controlDevice(ControlDeviceReqModel controlDeviceReqModel);
}

class RoomRepoImpl extends RoomRepo {
  @override
  Future<Either> addRooms(AddRoomsModel addRoomModel) {
    return getIt<ApiService>().addRooms(addRoomModel);
  }

  @override
  Future<Either> getRooms(String token) {
    return getIt<ApiService>().getRooms(token);
  }

  @override
  Future<Either> addRoomsNew(AddRoomNewModel addDeviceNewModel) {
    return getIt<ApiService>().addRoomsNew(addDeviceNewModel);
  }

  @override
  Future<Either> addNewDevice(AddDeviceReqModel addDeviceReqModel) {
    return getIt<ApiService>().addNewDevice(addDeviceReqModel);
  }

  @override
  Future<Either> changeDeviceStatus(
      DeviceControlReqModel deviceControlReqModel) {
    return getIt<ApiService>().changeDeviceStatus(deviceControlReqModel);
  }

  @override
  Future<Either> controlDevice(ControlDeviceReqModel controlDeviceReqModel) {
    return getIt<ApiService>().controlDevice(controlDeviceReqModel);
  }
}

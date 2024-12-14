import 'package:fpdart/src/either.dart';
import 'package:smart_way_home/data/services/api_services.dart';
import 'package:smart_way_home/features/home_screen/models/add_rooms_model.dart';
import 'package:smart_way_home/features/home_screen/models/new/add_room_new_model.dart';
import 'package:smart_way_home/utils/service_locator/service_locator.dart';

abstract class RoomRepo {
  Future<Either> addRooms(AddRoomsModel addRoomModel);
  Future<Either> getRooms(String token);
  Future<Either> addRoomsNew(AddRoomNewModel addDeviceNewModel);
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
}

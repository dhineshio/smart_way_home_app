import 'package:smart_way_home/common/usecase/use_case.dart';
import 'package:smart_way_home/data/repository/room_repo_impl.dart';
import 'package:smart_way_home/utils/service_locator/service_locator.dart';

class AddRoomUseCase extends UseCase {
  @override
  Future call(param) {
    return getIt<RoomRepo>().addRooms(param);
  }
}

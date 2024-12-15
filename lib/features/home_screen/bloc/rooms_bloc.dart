import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:get_storage/get_storage.dart';
import 'package:smart_way_home/features/home_screen/models/add_rooms_model.dart';
import 'package:smart_way_home/features/home_screen/models/new/add_device_req_model.dart';
import 'package:smart_way_home/features/home_screen/models/new/add_room_new_model.dart';
import 'package:smart_way_home/features/home_screen/models/new/device_control_req_model.dart';
import 'package:smart_way_home/features/home_screen/usecase/add_new_device_use_case.dart';
import 'package:smart_way_home/features/home_screen/usecase/add_room_new_use_case.dart';
import 'package:smart_way_home/features/home_screen/usecase/add_room_use_case.dart';
import 'package:smart_way_home/features/home_screen/usecase/device_control_use_case.dart';
import 'package:smart_way_home/features/home_screen/usecase/get_room_use_case.dart';
import 'package:smart_way_home/utils/service_locator/service_locator.dart';

part 'rooms_event.dart';
part 'rooms_state.dart';

class RoomsBloc extends Bloc<RoomsEvent, RoomsState> {
  RoomsBloc() : super(RoomsInitialState()) {
    on<ChangeDeviceStatus>((state, emit) async {
      try {
        final roomId = state.roomId;
        final deviceId = state.deviceId;
        final status = state.status;
        final response = await getIt<DeviceControlUseCase>().call(
          DeviceControlReqModel(
            roomId: roomId,
            deviceId: deviceId,
            status: status,
          ),
        );
        return response.fold(
            (failure) => emit(
                DeviceStatusChangedFailureState(error: "Failed to change")),
            (success) {
          return emit(DeviceStatusChangedSuccessState(
              response: "Status changed successfully"));
        });
      } catch (e) {
        return emit(AddDeviceFailureState(error: e.toString()));
      }
    });

    on<AddDeviceEvent>((state, emit) async {
      try {
        final roomId = state.roomId;
        final deviceName = state.deviceName;
        final deviceType = state.deviceType;
        final response = await getIt<AddNewDeviceUseCase>().call(
          AddDeviceReqModel(
            roomId: roomId,
            name: deviceName,
            type: deviceType,
          ),
        );
        return response.fold(
            (failure) => emit(AddDeviceFailureState(error: "Failed to Add")),
            (success) {
          return emit(
              AddDeviceSuccessState(response: (response as Right).value));
        });
      } catch (e) {
        return emit(AddDeviceFailureState(error: e.toString()));
      }
    });

    on<AddRoomsNewEvent>((state, emit) async {
      try {
        emit(RoomsLoadingState());
        final roomName = state.roomName;
        final esp32Ip = state.esp32Ip;
        final response = await getIt<AddRoomNewUseCase>().call(
          AddRoomNewModel(name: roomName, esp32Ip: esp32Ip),
        );
        return response.fold(
            (failure) => emit(AddRoomsNewFailureState(error: "Failed to Add")),
            (success) {
          return emit(
              AddRoomsNewSuccessState(response: (response as Right).value));
        });
      } catch (e) {
        return emit(AddRoomsNewFailureState(error: e.toString()));
      }
    });

    on<AddRoomsEvent>((state, emit) async {
      try {
        emit(RoomsLoadingState());
        final token = getIt<GetStorage>().read("access-token");
        final response = await getIt<AddRoomUseCase>()
            .call(AddRoomsModel(iconId: state.iconId, token: token!));
        return response.fold(
            (failure) =>
                emit(AddRoomsFailureState(error: (response as Left).value)),
            (success) => emit(
                AddRoomsSuccessState(response: (response as Right).value)));
      } catch (e) {
        return emit(AddRoomsFailureState(error: e.toString()));
      }
    });

    on<GetRoomsEvent>((state, emit) async {
      try {
        emit(RoomsLoadingState());
        final token = getIt<GetStorage>().read("access-token");
        final response = await getIt<GetRoomUseCase>().call(token);
        response.fold(
            (failure) =>
                emit(GetRoomsFailureState(error: (response as Left).value)),
            (success) {
          return emit(
              GetRoomsSuccessState(response: (response as Right).value));
        });
      } catch (e) {
        return emit(GetRoomsFailureState(error: e.toString()));
      }
    });
  }
}

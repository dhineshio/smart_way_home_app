import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:get_storage/get_storage.dart';
import 'package:smart_way_home/features/home_screen/models/add_rooms_model.dart';
import 'package:smart_way_home/features/home_screen/usecase/add_room_use_case.dart';
import 'package:smart_way_home/features/home_screen/usecase/get_room_use_case.dart';
import 'package:smart_way_home/utils/service_locator/service_locator.dart';

part 'rooms_event.dart';
part 'rooms_state.dart';

class RoomsBloc extends Bloc<RoomsEvent, RoomsState> {
  RoomsBloc() : super(RoomsInitialState()) {
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

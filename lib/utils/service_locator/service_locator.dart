import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:smart_way_home/data/repository/auth_repo_impl.dart';
import 'package:smart_way_home/data/repository/room_repo_impl.dart';
import 'package:smart_way_home/data/services/api_services.dart';
import 'package:smart_way_home/features/authentication/bloc/auth_bloc.dart';
import 'package:smart_way_home/features/authentication/usecase/login_use_case.dart';
import 'package:smart_way_home/features/authentication/usecase/register_use_case.dart';
import 'package:smart_way_home/features/authentication/usecase/send_otp_use_case.dart';
import 'package:smart_way_home/features/authentication/usecase/verify_otp_use_case.dart';
import 'package:smart_way_home/features/home_screen/bloc/rooms_bloc.dart';
import 'package:smart_way_home/features/home_screen/usecase/add_room_new_use_case.dart';
import 'package:smart_way_home/features/home_screen/usecase/add_room_use_case.dart';
import 'package:smart_way_home/features/home_screen/usecase/get_room_use_case.dart';
import 'package:smart_way_home/utils/http/http_client.dart';

final getIt = GetIt.instance;
Future<void> initiate() async {
  getIt.registerSingleton<GetStorage>(GetStorage());

  // Dio Client
  getIt.registerSingleton<HttpClient>(HttpClient());

  // Api Service
  getIt.registerSingleton<ApiService>(ApiServiceImpl());

  // Repository
  getIt.registerSingleton<AuthRepo>(AuthRepoImpl());
  getIt.registerSingleton<RoomRepo>(RoomRepoImpl());

  // Use Case
  getIt.registerSingleton<LoginUseCase>(LoginUseCase());
  getIt.registerSingleton<RegisterUseCase>(RegisterUseCase());
  getIt.registerSingleton<SendOtpUseCase>(SendOtpUseCase());
  getIt.registerSingleton<VerifyOtpUseCase>(VerifyOtpUseCase());
  getIt.registerSingleton<AddRoomUseCase>(AddRoomUseCase());
  getIt.registerSingleton<GetRoomUseCase>(GetRoomUseCase());
  getIt.registerSingleton<AddRoomNewUseCase>(AddRoomNewUseCase());

  // BLoc
  getIt.registerLazySingleton<AuthBloc>(() => AuthBloc());
  getIt.registerLazySingleton<RoomsBloc>(() => RoomsBloc());
}

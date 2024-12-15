import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:smart_way_home/features/authentication/models/login_req_model.dart';
import 'package:smart_way_home/features/authentication/models/register_req_model.dart';
import 'package:smart_way_home/features/authentication/models/verify_otp_model.dart';
import 'package:smart_way_home/features/home_screen/models/add_rooms_model.dart';
import 'package:smart_way_home/features/home_screen/models/new/add_device_req_model.dart';
import 'package:smart_way_home/features/home_screen/models/new/add_room_new_model.dart';
import 'package:smart_way_home/utils/constants/secrets.dart';
import 'package:smart_way_home/utils/http/http_client.dart';
import 'package:smart_way_home/utils/service_locator/service_locator.dart';

abstract class ApiService {
  Future<Either> register(RegisterReqModel registerReqModel);
  Future<Either> sendOtp(String email);
  Future<Either> login(LoginReqModel loginReqModel);
  Future<Either> verifyOtp(VerifyOtpModel verifyOtpModel);
  Future<Either> addRooms(AddRoomsModel addRoomsModel);
  Future<Either> getRooms(String token);
  Future<Either> addRoomsNew(AddRoomNewModel addDeviceNewModel);
  Future<Either> addNewDevice(AddDeviceReqModel addDeviceReqModel);
}

class ApiServiceImpl extends ApiService {
  @override
  Future<Either> register(RegisterReqModel registerReqModel) async {
    try {
      final response = await getIt<HttpClient>()
          .post(Secrets.registerEndPoint, data: registerReqModel.toMap());
      if (response.statusCode == 200) {
        return Right(response.data);
      } else {
        return Left(response.data);
      }
    } on DioException catch (e) {
      return Left(e.response!.data);
    }
  }

  @override
  Future<Either> sendOtp(String email) async {
    try {
      final response = await getIt<HttpClient>()
          .post(Secrets.sendOtpEndPoint, queryParameters: {"email": email});
      if (response.statusCode == 200) {
        return Right(response.data);
      } else {
        return Right(response.data);
      }
    } on DioException catch (e) {
      return Left(e.response!.data);
    }
  }

  @override
  Future<Either> verifyOtp(VerifyOtpModel verifyOtpModel) async {
    try {
      final response = await getIt<HttpClient>().post(Secrets.verifyOtpEndPoint,
          queryParameters: verifyOtpModel.toMap());
      if (response.statusCode == 200) {
        return Right(response.data);
      } else {
        return Left(response.data);
      }
    } on DioException catch (e) {
      return Left(e.response!.data);
    }
  }

  @override
  Future<Either> login(LoginReqModel loginReqModel) async {
    try {
      var response = await getIt<HttpClient>()
          .post(Secrets.loginEndPoint, data: loginReqModel.toMap());
      if (response.statusCode == 200) {
        return Right(response.data);
      } else {
        return Left(response.data);
      }
    } on DioException catch (e) {
      return Left(e.response!.data);
    }
  }

  @override
  Future<Either> addRooms(AddRoomsModel addRoomsModel) async {
    try {
      final response = await getIt<HttpClient>().post(
        Secrets.addRooms,
        queryParameters: {"iconId": addRoomsModel.iconId},
        options: Options(headers: addRoomsModel.sendToken()),
      );
      return Right(response.data['roomName']);
    } on DioException catch (e) {
      if (e.response!.statusCode == 400) {
        return const Left("Already Added");
      } else {
        return Left(e.response!.statusMessage);
      }
    }
  }

  @override
  Future<Either> getRooms(String token) async {
    try {
      final response = await getIt<HttpClient>().get(
        Secrets.getRooms,
        options: Options(headers: {"Authorization": token}),
      );
      if (response.statusCode == 200) {
        return Right(response.data);
      } else {
        return Left(response.data);
      }
    } on DioException catch (e) {
      return Left(e.response!.data);
    }
  }

  @override
  Future<Either> addRoomsNew(AddRoomNewModel addDeviceNewModel) async {
    try {
      final response = await getIt<HttpClient>()
          .post(Secrets.addRoomsNew, data: addDeviceNewModel.toMap());
      if (response.statusCode == 200) {
        return Right(response.data);
      } else {
        return Left(response.data);
      }
    } on DioException catch (e) {
      return Left(e.response!.data);
    }
  }

  @override
  Future<Either> addNewDevice(AddDeviceReqModel addDeviceReqModel) async {
    try {
      final response = await getIt<HttpClient>().post(
          "${Secrets.addRoomsNew}/${addDeviceReqModel.roomId}/devices",
          data: addDeviceReqModel.toMap());
      if (response.statusCode == 200) {
        return Right(response.data);
      } else {
        return Left(response.data);
      }
    } on DioException catch (e) {
      return Left(e.response!.data);
    }
  }
}

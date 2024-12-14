import 'package:fpdart/fpdart.dart';
import 'package:smart_way_home/data/services/api_services.dart';
import 'package:smart_way_home/features/authentication/models/login_req_model.dart';
import 'package:smart_way_home/features/authentication/models/register_req_model.dart';
import 'package:smart_way_home/features/authentication/models/verify_otp_model.dart';
import 'package:smart_way_home/utils/service_locator/service_locator.dart';

abstract class AuthRepo {
  Future<Either> register(RegisterReqModel registerReqModel);
  Future<Either> sendOtp(String email);
  Future<Either> login(LoginReqModel loginReqModel);
  Future<Either> verifyOtp(VerifyOtpModel verifyOtpModel);
}

class AuthRepoImpl extends AuthRepo {
  @override
  Future<Either> register(RegisterReqModel registerReqModel) {
    return getIt<ApiService>().register(registerReqModel);
  }

  @override
  Future<Either> sendOtp(String email) {
    return getIt<ApiService>().sendOtp(email);
  }

  @override
  Future<Either> verifyOtp(VerifyOtpModel verifyOtpModel) {
    return getIt<ApiService>().verifyOtp(verifyOtpModel);
  }

  @override
  Future<Either> login(LoginReqModel loginReqModel) {
    return getIt<ApiService>().login(loginReqModel);
  }
}

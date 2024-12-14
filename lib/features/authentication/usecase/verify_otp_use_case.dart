import 'package:smart_way_home/common/usecase/use_case.dart';
import 'package:smart_way_home/data/repository/auth_repo_impl.dart';
import 'package:smart_way_home/utils/service_locator/service_locator.dart';

class VerifyOtpUseCase extends UseCase {
  @override
  Future call(param) {
    return getIt<AuthRepo>().verifyOtp(param);
  }
}
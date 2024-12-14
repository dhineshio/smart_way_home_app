import 'package:fpdart/fpdart.dart';
import 'package:smart_way_home/common/usecase/use_case.dart';
import 'package:smart_way_home/data/repository/auth_repo_impl.dart';
import 'package:smart_way_home/utils/service_locator/service_locator.dart';

class LoginUseCase extends UseCase {
  @override
  Future<Either> call(param) {
    return getIt<AuthRepo>().login(param);
  }
}

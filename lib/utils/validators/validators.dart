import 'package:get/get_utils/src/get_utils/get_utils.dart';
import 'package:smart_way_home/utils/constants/text.dart';

class Validators {
  Validators._();

  static String? emailValidator(String value) {
    if (value.isEmpty) {
      return SText.fieldRequiredError;
    }
    if (!GetUtils.isEmail(value)) {
      return SText.validEmailError;
    }
    return null;
  }

  static String? passwordValidator(String value) {
    if (value.isEmpty) {
      return SText.fieldRequiredError;
    }
    if (value.length < 6) {
      return SText.passwordLengthError;
    }
    return null;
  }
}

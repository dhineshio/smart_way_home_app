import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_way_home/common/widgets/validators/controllers/password_validator_controller.dart';
import 'package:smart_way_home/utils/constants/icons.dart';
import 'package:smart_way_home/utils/constants/sizes.dart';
import 'package:smart_way_home/utils/constants/text.dart';
import 'package:smart_way_home/utils/image_convert/FUI.dart';
import 'package:smart_way_home/utils/validators/validators.dart';

class PasswordValidatorWidget extends StatelessWidget {
  PasswordValidatorWidget({
    super.key,
    required this.passwordController,
    required this.passwordFocusNode,
  });

  final TextEditingController passwordController;
  final FocusNode passwordFocusNode;
  final PasswordValidatorController _controller =
      Get.put(PasswordValidatorController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TextFormField(
        controller: passwordController,
        focusNode: passwordFocusNode,
        obscureText: _controller.isPasswordVisible.value,
        validator: (value) => Validators.passwordValidator(value!),
        decoration: InputDecoration(
          label: const Text(SText.passwordHint),
          prefixIcon: const Padding(
            padding: EdgeInsets.all(SSizes.md),
            child: FUI(SIcons.passwordIcon),
          ),
          suffixIcon: IconButton(
            onPressed: () {
              _controller.isPasswordVisible.toggle();
            },
            icon: Icon(
              _controller.isPasswordVisible.value
                  ? Icons.visibility
                  : Icons.visibility_off,
            ),
          ),
        ),
      ),
    );
  }
}

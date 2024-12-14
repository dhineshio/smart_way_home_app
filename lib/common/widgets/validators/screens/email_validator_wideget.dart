import 'package:flutter/material.dart';
import 'package:smart_way_home/utils/constants/icons.dart';
import 'package:smart_way_home/utils/constants/sizes.dart';
import 'package:smart_way_home/utils/constants/text.dart';
import 'package:smart_way_home/utils/image_convert/FUI.dart';
import 'package:smart_way_home/utils/validators/validators.dart';

class EmailValidationWidget extends StatelessWidget {
  const EmailValidationWidget({
    super.key,
    required this.emailController,
    required this.emailFocusNode,
  });

  final TextEditingController emailController;
  final FocusNode emailFocusNode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: emailController,
      focusNode: emailFocusNode,
      textInputAction: TextInputAction.next,
      validator: (value) => Validators.emailValidator(value!),
      decoration: const InputDecoration(
        label: Text(SText.emailHint),
        prefixIcon: Padding(
          padding: EdgeInsets.all(SSizes.md),
          child: FUI(SIcons.userNameIcon),
        ),
      ),
    );
  }
}

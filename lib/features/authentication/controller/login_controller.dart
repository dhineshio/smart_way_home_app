import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:smart_way_home/features/authentication/bloc/auth_bloc.dart';

class LoginController extends GetxController {
  final isLoading = false.obs;

  final loginFormKey = GlobalKey<FormState>();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void submitLogin(BuildContext context) {
    if (loginFormKey.currentState?.validate() == true) {
      context.read<AuthBloc>().add(
            RequestLoginEvent(
                email: emailController.text, password: passwordController.text),
          );
    }
  }

  @override
  void onClose() {
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:smart_way_home/common/widgets/or_divider/or_divider.dart';
import 'package:smart_way_home/common/widgets/progress/progress.dart';
import 'package:smart_way_home/common/widgets/validators/screens/email_validator_wideget.dart';
import 'package:smart_way_home/common/widgets/validators/screens/password_validator_widget.dart';
import 'package:smart_way_home/features/authentication/bloc/auth_bloc.dart';
import 'package:smart_way_home/features/authentication/controller/login_controller.dart';
import 'package:smart_way_home/utils/constants/colors.dart';
import 'package:smart_way_home/utils/constants/icons.dart';
import 'package:smart_way_home/utils/constants/sizes.dart';
import 'package:smart_way_home/utils/constants/text.dart';
import 'package:smart_way_home/utils/devices/device_utils.dart';
import 'package:smart_way_home/utils/image_convert/FUI.dart';
import 'package:smart_way_home/utils/routes/app_routes.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final LoginController _controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthLoadingState) {
          _controller.isLoading.value = true;
        }
        if (state is LoginFailureState) {
          _controller.isLoading.value = false;
          Get.snackbar(
            "Login Failed",
            state.error,
            duration: 1000.milliseconds,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: SColors.error,
            colorText: SColors.textWhite,
          );
        }
        if (state is LoginSuccessState) {
          _controller.isLoading.value = false;
          Get.toNamed(SAppRoutes.mainScreen);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: SizedBox(
              height: SDeviceUtils.getScreenHeight(),
              width: SDeviceUtils.getScreenWidth(context),
              child: Stack(
                children: [
                  buildBoxStyle(
                    height: 120,
                    width: 120,
                    top: 120,
                    right: -60,
                    opacity: .5,
                  ),
                  buildBoxStyle(
                    height: 150,
                    width: 150,
                    left: -50,
                    opacity: 0.10,
                    top: 20,
                  ),
                  SafeArea(
                    child: Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: SSizes.md),
                      // Form Login
                      child: Form(
                        key: _controller.loginFormKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: SSizes.spaceHigh),
                            Text(SText.loginTitle1, style: text.headlineLarge),
                            const SizedBox(height: SSizes.spaceBtwItems),
                            Text(SText.loginSubTitle, style: text.bodyMedium),
                            const SizedBox(height: SSizes.spaceBtwSections),
                            // ! Email Field
                            EmailValidationWidget(
                              emailController: _controller.emailController,
                              emailFocusNode: _controller.emailFocusNode,
                            ),
                            const SizedBox(height: SSizes.spaceBtwInputFields),
                            // ! Password Field
                            PasswordValidatorWidget(
                              passwordController:
                                  _controller.passwordController,
                              passwordFocusNode: _controller.passwordFocusNode,
                            ),
                            // Forgot Password
                            Center(
                              child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  SText.forgot,
                                  style: text.bodyMedium,
                                ),
                              ),
                            ),
                            const SizedBox(height: SSizes.spaceBtwInputFields),
                            // ! Login Button
                            Center(
                              child: SizedBox(
                                width: SSizes.buttonWidth,
                                child: Obx(
                                  () => ElevatedButton(
                                    onPressed: () =>
                                        _controller.submitLogin(context),
                                    child: _controller.isLoading.value == true
                                        ? const SizedBox(
                                            width: SSizes.progressSize,
                                            height: SSizes.progressSize,
                                            child: ShowProgressBar(),
                                          )
                                        : Text(
                                            // Progress has to add here
                                            SText.btnText1,
                                            style: text.bodyMedium!.copyWith(
                                              color: SColors.textWhite,
                                            ),
                                          ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: SSizes.spaceBtwSections),
                            const OrDividerWidget(),
                            const SizedBox(height: SSizes.spaceBtwSections),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FUI(SIcons.googleIcon),
                                SizedBox(width: 40),
                                FUI(SIcons.facebookIcon),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: SSizes.md,
                      ),
                      child: Text(
                        SText.loginTerms,
                        style: text.labelMedium,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Positioned buildBoxStyle({
    required double height,
    required double width,
    double? opacity = 1,
    double? angle = 65,
    double? top,
    double? right,
    double? bottom,
    double? left,
  }) {
    return Positioned(
      left: left,
      top: top,
      bottom: bottom,
      right: right,
      child: Transform.rotate(
        angle: angle!,
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              color: SColors.primary.withOpacity(opacity!),
              borderRadius: BorderRadius.circular(SSizes.borderRadiuslg)),
        ),
      ),
    );
  }
}

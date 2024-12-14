import 'package:get/get.dart';
import 'package:smart_way_home/features/authentication/screens/login_screen.dart';
import 'package:smart_way_home/features/authentication/screens/signup_screen.dart';
import 'package:smart_way_home/features/main_screen/screens/main_screen.dart';
import 'package:smart_way_home/features/on_boarding/screens/on_boarding.dart';

class SAppRoutes {
  SAppRoutes._();

  static const String onBoarding = "/onBoarding";
  static const String loginPage = "/loginPage";
  static const String signUpPage = "/signUpPage";
  static const String mainScreen = "/mainScreen";

  static List<GetPage> pages = [
    GetPage(name: onBoarding, page: () => const OnBoarding()),
    GetPage(name: loginPage, page: () => LoginScreen()),
    GetPage(name: signUpPage, page: () => const SignupScreen()),
    GetPage(name: mainScreen, page: () => MainScreen())
  ];
}

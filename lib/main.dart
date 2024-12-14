import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:smart_way_home/features/authentication/bloc/auth_bloc.dart';
import 'package:smart_way_home/features/home_screen/bloc/rooms_bloc.dart';
import 'package:smart_way_home/utils/constants/colors.dart';
import 'package:smart_way_home/utils/devices/device_utils.dart';
import 'package:smart_way_home/utils/routes/app_routes.dart';
import 'package:smart_way_home/utils/service_locator/service_locator.dart';
import 'package:smart_way_home/utils/themes/theme.dart';

void main() async {
  await initiate();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    SDeviceUtils.setStatusBarColor(
      statusBarFor: Brightness.dark,
      statusBarbgColor: Colors.transparent,
      navBarBgColor: SColors.bgLight,
      navBarFor: Brightness.dark,
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<AuthBloc>()),
        BlocProvider(create: (context) => getIt<RoomsBloc>()),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        getPages: SAppRoutes.pages,
        initialRoute: SAppRoutes.onBoarding,
        themeMode: ThemeMode.system,
        theme: SAppTheme.themeLight,
        darkTheme: SAppTheme.themeDark,
      ),
    );
  }
}

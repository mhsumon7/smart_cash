import 'package:get/get_navigation/src/routes/get_route.dart';

import '../../data/bindings/dashboard_bindings.dart';
import '../screens/home/home.dart';
import '../screens/login/login.dart';
import '../screens/splash/splash.dart';


class Routes {
  static const String initialRoute = '/';
  static const String loginRoute = '/login';
  static const String homeRoute = '/home';
}

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: Routes.initialRoute,
      page: () => const SplashView(),
    ),
    GetPage(
      name: Routes.loginRoute,
      page: () => const LoginView(),
    ),
    GetPage(
        name: Routes.homeRoute,
        page: () => const HomeView(),
        binding: DashboardBindings()),
  ];
}

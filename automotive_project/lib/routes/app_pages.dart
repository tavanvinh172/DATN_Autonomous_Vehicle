import 'package:automotive_project/modules/auth/login/bindings/login_binding.dart';
import 'package:automotive_project/modules/auth/login/views/login_view.dart';
import 'package:automotive_project/modules/favorite/bindings/favorite_binding.dart';
import 'package:automotive_project/modules/favorite/views/favorite_view.dart';
import 'package:automotive_project/modules/home/bindings/home_binding.dart';
import 'package:automotive_project/modules/home/views/home_details.dart';
import 'package:automotive_project/modules/home/views/home_view.dart';
import 'package:automotive_project/modules/main/bindings/main_binding.dart';
import 'package:automotive_project/modules/main/views/main_view.dart';
import 'package:automotive_project/modules/onboarding/bindings/onboarding_binding.dart';
import 'package:automotive_project/modules/onboarding/views/onboarding_screen.dart';
import 'package:automotive_project/modules/other/bindings/other_binding.dart';
import 'package:automotive_project/modules/other/views/other_view.dart';
import 'package:automotive_project/modules/settings/bindings/settings_binding.dart';
import 'package:automotive_project/modules/settings/views/settings_view.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.MAIN;

  static const LOGIN = Routes.LOGIN;

  static const ONBOARDING = Routes.ONBOARDING;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.MAIN,
      page: () => MainView(),
      binding: MainBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.HOME_DETAILS,
      page: () => DetailCars(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.FAVORITE,
      page: () => const FavoriteView(),
      binding: FavoriteBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => const SettingsView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: _Paths.OTHER,
      page: () => const OtherView(),
      binding: OtherBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => OnboardingScreen(),
      binding: OnboardingBinding(),
    ),
  ];
}

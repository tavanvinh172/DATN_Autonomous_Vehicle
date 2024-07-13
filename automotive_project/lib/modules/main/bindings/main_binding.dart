import 'package:automotive_project/modules/favorite/controllers/favorite_controller.dart';
import 'package:automotive_project/modules/home/controllers/home_controller.dart';
import 'package:automotive_project/modules/main/controllers/main_controller.dart';
import 'package:automotive_project/modules/other/controllers/other_controller.dart';
import 'package:automotive_project/modules/settings/controllers/settings_controller.dart';
import 'package:get/get.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(
      () => MainController(),
      fenix: true,
    );
    Get.lazyPut<OtherController>(
      () => OtherController(),
      fenix: true,
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
      fenix: true,
    );
    Get.lazyPut<FavoriteController>(
      () => FavoriteController(),
    );
    Get.lazyPut<SettingsController>(
      () => SettingsController(),
    );
  }
}

import 'package:automotive_project/core/base/base_controller.dart';
import 'package:automotive_project/modules/home/controllers/home_controller.dart';
import 'package:automotive_project/modules/main/model/menu_code.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class MainController extends BaseController
    with GetSingleTickerProviderStateMixin {
  final _selectedMenuCodeController = MenuCode.HOME.obs;
  final homeController = Get.find<HomeController>();
  MenuCode get selectedMenuCode => _selectedMenuCodeController.value;
  late final AnimationController animationController;
  final lifeCardUpdateController = false.obs;
  final pingStatus = false.obs;
  final scanDetection = false.obs;
  @override
  void onInit() {
    super.onInit();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 20))
          ..repeat();
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }

  onMenuSelected(MenuCode menuCode) async {
    if (menuCode != MenuCode.HOME) {
      if (homeController.isInitialized.value) {
        homeController.isPowerOn.value = false;
        homeController.isInitialized.value = false;
        homeController.vlcViewController.dispose();
      }
    }
    _selectedMenuCodeController(menuCode);
  }
}

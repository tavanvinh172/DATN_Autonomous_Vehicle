import 'package:automotive_project/core/base/base_controller.dart';
import 'package:automotive_project/core/widget/show_toast_message.dart';
import 'package:automotive_project/data/local/preference/preference_manager.dart';
import 'package:automotive_project/data/repository/auth/auth_repository.dart';
import 'package:automotive_project/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends BaseController
    with GetSingleTickerProviderStateMixin {
  final usernameController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  late AnimationController controller;
  late Animation<Offset> offsetAnimation;
  final AuthRepository _authRepository =
      Get.find(tag: (AuthRepository).toString());
  final sharePref =
      Get.find<PreferenceManager>(tag: (PreferenceManager).toString());

  @override
  void onInit() {
    super.onInit();
    controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    offsetAnimation = Tween<Offset>(
      begin: const Offset(0.0, -2),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.easeInOut,
    ));

    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  login() {
    final username = usernameController.value.text;
    final password = passwordController.value.text;
    if (username.isNotEmpty && password.isNotEmpty) {
      callDataService(_authRepository.login(username, password),
          onSuccess: (response) {
        if (response['data']['User']['token'].isEmpty) {
          showToastErrorMessage('Thông báo', "Đăng nhập thất bại!");
          return;
        } else {
          showToastSuccessMessage('Thông báo', 'Đăng nhập thành công!');
          sharePref.setString(
              PreferenceManager.keyToken, response['data']['User']['token']);
          Get.offAllNamed(Routes.MAIN);
        }
      });
    }
  }
}

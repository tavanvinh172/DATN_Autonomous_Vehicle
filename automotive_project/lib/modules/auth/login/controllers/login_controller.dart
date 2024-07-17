import 'dart:convert';

import 'package:automotive_project/core/base/base_controller.dart';
import 'package:automotive_project/core/widget/show_toast_message.dart';
import 'package:automotive_project/data/local/preference/preference_manager.dart';
import 'package:automotive_project/data/repository/auth/auth_repository.dart';
import 'package:automotive_project/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends BaseController
    with GetSingleTickerProviderStateMixin {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  late AnimationController controller;
  late Animation<Offset> offsetAnimation;
  final AuthRepository _authRepository =
      Get.find(tag: (AuthRepository).toString());
  final sharePref =
      Get.find<PreferenceManager>(tag: (PreferenceManager).toString());

  final usernameSignupController = TextEditingController();
  final passwordSignupController = TextEditingController();
  final displayNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final isSubmit = false.obs;

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

  login() async {
    final username = usernameController.text;
    final password = passwordController.text;
    isSubmit.value = true;
    if (username.isNotEmpty && password.isNotEmpty) {
      final response = await _authRepository.login(username, password);
      // print();
      if (response['data']['User']['token'].isEmpty) {
        showToastErrorMessage('Thông báo', "Đăng nhập thất bại!");
        return;
      } else {
        showToastSuccessMessage('Thông báo', 'Đăng nhập thành công!');
        sharePref.setString(
            PreferenceManager.userStore, jsonEncode(response['data']['User']));
        sharePref.setString(
            PreferenceManager.keyToken, response['data']['User']['token']);
        Get.offAllNamed(Routes.MAIN);
      }
      isSubmit.value = true;
    }
  }

  signup() async {
    final username = usernameSignupController.text;
    final password = passwordSignupController.text;
    final displayName = displayNameController.text;
    final email = emailController.text;
    final phoneNumber = phoneNumberController.text;
    isSubmit.value = true;
    if (username.isNotEmpty &&
        password.isNotEmpty &&
        displayName.isNotEmpty &&
        email.isNotEmpty &&
        phoneNumber.isNotEmpty) {
      final response = await _authRepository.signup(
        email: email,
        fullName: displayName,
        password: password,
        phone: phoneNumber,
        type: 1,
        username: username,
      );
      isSubmit.value = false;
      Get.back();
      if (!response['res'].contains('done')) {
        showToastErrorMessage('Thông báo', "Đăng ký tài khoản thất bại!");
        return;
      }
      showToastSuccessMessage('Thông báo', 'Đăng ký thành công!');
    }
  }
}

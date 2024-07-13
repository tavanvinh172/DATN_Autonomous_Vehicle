import 'package:automotive_project/core/values/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';

showToastSuccessMessage(String title, String message) {
  return Get.snackbar(
    title,
    message,
    backgroundColor: AppColors.successColor,
    colorText: Colors.white,
    margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
    icon: const SizedBox(
      width: 50,
      height: 50,
      child: RiveAnimation.asset(
        "assets/RiveAssets/succes.riv",
        fit: BoxFit.cover,
      ),
    ),
  );
}

showToastErrorMessage(String title, String message) {
  return Get.snackbar(
    title,
    message,
    backgroundColor: AppColors.errorColor,
    colorText: Colors.white,
    margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
    icon: const SizedBox(
      width: 50,
      height: 50,
      child: RiveAnimation.asset(
        "assets/RiveAssets/x_aniation.riv",
        fit: BoxFit.cover,
      ),
    ),
  );
}
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NetworkController extends GetxController {
  final Connectivity _connectivity = Connectivity();
  var isHavingConnection = false.obs;
  @override
  void onInit() {
    _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    super.onInit();
  }

  void _updateConnectionStatus(List<ConnectivityResult> connectivityResult) {
    if (connectivityResult[0] == ConnectivityResult.none) {
      isHavingConnection.value = false;
      Get.rawSnackbar(
        messageText: const Text(
          "MẤT KẾT NỐI MẠNG",
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
        isDismissible: false,
        duration: const Duration(days: 1),
        backgroundColor: Colors.red[400]!,
        icon: const Icon(Icons.wifi_off, color: Colors.white, size: 35),
        margin: EdgeInsets.zero,
        padding: const EdgeInsets.all(30),
        snackStyle: SnackStyle.GROUNDED,
      );
    } else {
      isHavingConnection.value = true;
      if (Get.isSnackbarOpen) {
        Get.closeCurrentSnackbar();
        Get.rawSnackbar(
          messageText: const Text(
            "ĐÃ KẾT NỐI LẠI",
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          isDismissible: true,
          duration: const Duration(seconds: 1),
          backgroundColor: Colors.green[400]!,
          icon: const Icon(Icons.wifi, color: Colors.white, size: 35),
          margin: EdgeInsets.zero,
          padding: const EdgeInsets.all(30),
          snackStyle: SnackStyle.GROUNDED,
        );
      }
    }
  }
}

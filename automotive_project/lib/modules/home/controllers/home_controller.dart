import 'dart:async';
import 'dart:math';

import 'package:automotive_project/core/base/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:get/get.dart';
import 'package:network_info_plus/network_info_plus.dart';

enum Mode {
  mannual('Điều khiển', 'mannual'),
  auto("Tự động", 'auto');

  const Mode(this.label, this.value);
  final String label;
  final String value;
}

class HomeController extends BaseController
    with GetSingleTickerProviderStateMixin {
  late VlcPlayerController vlcViewController;
  final info = NetworkInfo();
  var ipAdress = "".obs;
  var messageSocket = "".obs;
  var isInitialized = false.obs;
  var isPowerOn = false.obs;
  var isVlcplayerInitialized = false.obs;
  final nameDeviceController = TextEditingController();
  final ipAddressController = TextEditingController();
  final portController = TextEditingController();
  final isSubmit = false.obs;
  late Timer timer;
  @override
  void onInit() async {
    ipAdress.value = (await getCurrentIpAddress())!;
    isInitialized.value = true;
    // timer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
    //   data[0] = generateRandomList(5);
    //   terminalDatas.add(generateRandomList(5));
    // });
    super.onInit();
  }

  List<int> generateRandomList(int length) {
    Random random = Random();
    List<int> resultList = [];

    for (int i = 0; i < length; i++) {
      resultList.add(
          random.nextInt(100)); // Generate random integers between 0 and 99
    }

    return resultList;
  }

  initializeVlcPlayer() {
    isInitialized.value = true;
    vlcViewController = VlcPlayerController.network(
        "rtsp://rtsp-test-server.viomic.com:554/stream",
        hwAcc: HwAcc.full,
        autoPlay: true,
        options: VlcPlayerOptions());
    // isVlcplayerInitialized.value = vlcViewController.value.isInitialized;
    // if (vlcViewController.value.isInitialized) {
    //   isInitialized.value = false;
    // }
  }

  Future<String?> getCurrentIpAddress() async {
    final wifiIP = await info.getWifiIP();
    if (wifiIP != null) {
      return wifiIP;
    }
    return "";
  }

  Future<void> restartPlayer() async {
    if (!isInitialized.value) {
      vlcViewController.initialize();
    } else {
      isInitialized.value = false;
      vlcViewController.stop();
      vlcViewController.value = vlcViewController.value.copyWith(
        isPlaying: false,
        isBuffering: false,
        position: Duration.zero,
        duration: Duration.zero,
      );
      isInitialized.value = true;
      vlcViewController.play();
    }
  }

  // void messageReceived(String msg) {
  //   messageSocket("aaaaaa");
  //   socketConnection.sendMessage("aaaaaa");
  // }

  // //starting the connection and listening to the socket asynchronously
  // void startConnection() async {
  //   socketConnection.enableConsolePrint(
  //       true); //use this to see in the console what's happening
  //   if (await socketConnection.canConnect(5000, attempts: 3)) {
  //     //check if it's possible to connect to the endpoint
  //     await socketConnection.connect(5000, messageReceived, attempts: 3);
  //     socketConnection.sendMessage("aaaaaa");
  //   }
  // }

  @override
  void dispose() async {
    timer.cancel();
    isInitialized.value = false;
    await vlcViewController.stopRendererScanning();
    await vlcViewController.dispose();
    super.dispose();
  }
}

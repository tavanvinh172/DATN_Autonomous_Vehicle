import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:automotive_project/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:get/get.dart';

class SocketController extends GetxController {
  final currentIp = "10.0.82.25".obs;
  final dataSensors = [
    [0, 0, 0, 0, 0]
  ].obs;
  final terminalDatas = [
    [0, 0, 0, 0, 0]
  ].obs;
  final sensors = <String>[].obs;
  final listIp = <String>[].obs;
  final base64Image = ''.obs;
  final joinDatas = [].obs;
  late VlcPlayerController vlcViewController;
  var isInitialized = false.obs;
  final ScrollController scrollController = ScrollController();
  Rx<Map<String, dynamic>> deviceInfor = Rx(<String, dynamic>{});
  Image imageFromBase64String(String base64String) {
    return Image.memory(base64Decode(base64String));
  }

  Uint8List dataFromBase64String(String base64String) {
    return base64Decode(base64String);
  }

  String base64String(Uint8List data) {
    return base64Encode(data);
  }

  @override
  void onInit() {
    socket.connect();
    socket.on("infor", (data) {
      print(data);
      for (var element in jsonDecode(data.split(":")[1])) {
        if (!listIp.contains(element)) {
          listIp.add(element);
        }
      }
    });

    // lắng nghe sự kiện từ xe command
    socket.on("vehicle", (data) {
      print("vehicle: $data");
    });

    // lắng nghe messager từ serve
    socket.on("msg", (data) {
      print('message: $data');
    });

    // lắng nghe thông số từ sensor
    socket.on("sensor", (data) {
      dataSensors[0] = jsonDecode(data).cast<int>();
      terminalDatas.add(jsonDecode(data).cast<int>());
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          curve: Curves.easeOut,
          duration: const Duration(milliseconds: 500),
        );
      }
    });

    socket.on("join", (data) {
      print('join: $data');
      // Find the index of the opening curly brace '{' after 'join:'
      var startIndex = data.indexOf('{');
      // Find the index of the closing curly brace '}' from the end of the string
      var endIndex = data.lastIndexOf('}') + 1;

      // Extract the substring containing only the JSON object
      var jsonObjectString = data.substring(startIndex, endIndex);

      // Parse the JSON string to a Dart object (Map)
      Map<String, dynamic> jsonObject = jsonDecode(jsonObjectString);
      deviceInfor.value = jsonObject;
    });

    socket.on("frame", (data) {
      base64Image.value = data;
      // print('frame2: ${data.split(":")[1]}');
    });
    super.onInit();
  }

  @override
  void dispose() {
    socket.disconnect();
    socket.dispose();
    super.dispose();
  }

  void sendIP(String ip) async {
    // var command = "connect:$ip";
    currentIp.value = ip;
    // socket.emit("vehicle command", command);
    joinRoom(currentIp.value);
  }

  // void initSocket() {
  //   socket.on("connect", (_) {
  //     print(socket.id);
  //   });

  //   socket.on("infor", (data) {
  //     print("infor: $data");
  //   });

  //   // lắng nghe sự kiện từ xe command
  //   socket.on("vehicle", (data) {
  //     print("vehicle: $data");
  //   });

  //   // lắng nghe messager từ serve
  //   socket.on("msg", (data) {
  //     print('message: $data');
  //   });

  //   // lắng nghe thông số từ sensor
  //   socket.on("sensor", (data) {
  //     sensors.value = data;
  //   });

  //   socket.on("join", (data) {
  //     print('join: $data');
  //   });

  //   socket.emit("infor", "scan_vehicles");

  //   socket.emit("join", "192.168.1.25");

  //   socket.connect();
  // }
  initializeVlcPlayer(String ipAddress) async {
    isInitialized.value = true;
    vlcViewController = VlcPlayerController.network(
        "rtsp://$ipAddress:8554/video_stream",
        hwAcc: HwAcc.full,
        autoPlay: true,
        options: VlcPlayerOptions());
    // isVlcplayerInitialized.value = vlcViewController.value.isInitialized;
    // if (vlcViewController.value.isInitialized) {
    //   isInitialized.value = false;
    // }
  }

  void switchMode(String mode) {
    final data = {'room_name': currentIp.value, 'data': 'mode:$mode'};
    socket.emit('vehicle command', jsonEncode(data));
  }

  void joinRoom(String ipAddress) {
    socket.emit("join", ipAddress);
  }

  Future<void> scanVehicles() async {
    socket.emit("infor", "scan_vehicles");
    // onInfo();
  }

  void onJoin() {
    socket.on("join", (data) {
      print('join: $data');
    });
  }

  void switchVehicle() {
    currentIp.value = "";
    socket.emit('leave', currentIp.value);
  }

  void onMessage() {
    // lắng nghe messager từ serve
    socket.on("msg", (data) {
      print('message: $data');
    });
  }

  void onConnect() {
    socket.on("connect", (_) {
      print(socket.id);
    });
  }

  void onInfo() {
    socket.on("infor", (data) {
      // print("runTimeType: ${}");
    });
  }

  void toLeft() {
    String command = "decision:Left";
    final data = {
      'data': command,
      'room_name': currentIp.value,
    };
    socket.emit("vehicle command", jsonEncode(data));
  }

  void toRight() {
    String command = "decision:Right";
    final data = {
      'data': command,
      'room_name': currentIp.value,
    };
    socket.emit("vehicle command", jsonEncode(data));
  }

  void toDownward() {
    String command = "decision:x";
    final data = {
      'data': command,
      'room_name': currentIp.value,
    };
    socket.emit("vehicle command", jsonEncode(data));
  }

  void toUp() {
    String command = "decision:Up";
    final data = {
      'data': command,
      'room_name': currentIp.value,
    };
    socket.emit("vehicle command", jsonEncode(data));
  }

  void stop() {
    String command = "decision:s";
    final data = {
      'data': command,
      'room_name': currentIp.value,
    };
    socket.emit("vehicle command", jsonEncode(data));
  }
}

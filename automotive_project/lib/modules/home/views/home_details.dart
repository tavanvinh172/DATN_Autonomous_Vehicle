import 'dart:convert';

import 'package:automotive_project/core/controllers/socket_controller.dart';
import 'package:automotive_project/core/values/app_colors.dart';
import 'package:automotive_project/core/values/app_theme.dart';
import 'package:automotive_project/core/widget/text_field_with_title.dart';
import 'package:automotive_project/data/model/devices/device.dart';
import 'package:automotive_project/main.dart';
import 'package:automotive_project/modules/home/controllers/home_controller.dart';
import 'package:automotive_project/modules/home/widgets/build_sensors.dart';
import 'package:automotive_project/modules/home/widgets/build_terminal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:get/get.dart';

class DetailCars extends StatelessWidget {
  DetailCars({super.key});
  final id = Get.arguments['id'];
  final nameDeviceController = TextEditingController();
  final ipAddressController = TextEditingController();
  final portController = TextEditingController();
  final socketController = Get.put(SocketController());
  late VlcPlayerController vlcViewController;
  final homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: GetBuilder<HomeController>(
          initState: (getBuilderState) async {
            // final socket = await Socket.connect('192.168.1.14', 5000);
            // Replace 'http://your_server_ip:5000' with your actual server URL and port
            final Device device = objectbox.getDeviceById(Get.arguments['id']);
            nameDeviceController.text = device.deviceName ?? "";
            ipAddressController.text = device.ipAddress;
            portController.text = device.port ?? "";
            socketController.sendIP(device.ipAddress);
            socketController.switchMode(Mode.mannual.value);
            // socketController.initSocket();
            socketController.isInitialized.value = true;
            vlcViewController = VlcPlayerController.network(
                "rtsp://${device.ipAddress}:8554/video_stream",
                hwAcc: HwAcc.full,
                autoPlay: true,
                options: VlcPlayerOptions());
          },
          init: HomeController(),
          builder: (controller) {
            return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                // backgroundColor: AppColors.lightGreyColor.withOpacity(.1),
                centerTitle: true,
                title: Text(
                  objectbox.getDeviceById(Get.arguments['id']).ipAddress,
                  style: MyThemes.textTheme.titleLarge!,
                ),
                actions: [
                  IconButton(
                      onPressed: () {
                        socketController.switchVehicle();
                        Get.back();
                      },
                      icon: const Icon(Icons.swap_horizontal_circle_sharp))
                ],
              ),
              body: SingleChildScrollView(
                child: Obx(
                  () => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ExpansionTile(
                        initiallyExpanded: false,
                        title: Text('Thông tin xe',
                            style: MyThemes.textTheme.titleLarge),
                        tilePadding: const EdgeInsetsDirectional.symmetric(
                            horizontal: 10.0),
                        shape: const Border(),
                        children: [buildVehicleInfor()],
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10, bottom: 20),
                        child: Text(
                          "Số thiết bị đang kết nối: ${socketController.deviceInfor.value['members']?.length ?? 0}",
                          style: MyThemes.textTheme.titleLarge,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: DropdownMenu(
                          initialSelection:
                              socketController.deviceInfor.value['mode'] ??
                                  'mannual',
                          label: Text(
                            'Chế độ',
                            style: MyThemes.textTheme.titleMedium,
                          ),
                          dropdownMenuEntries: Mode.values.map(
                            (value) {
                              return DropdownMenuEntry(
                                value: value.value,
                                label: value.label,
                                style: MenuItemButton.styleFrom(
                                  backgroundColor: AppColors.appBarColor,
                                ),
                              );
                            },
                          ).toList(),
                          onSelected: (value) {
                            socketController.switchMode(value.toString());
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      // VlcPlayer(
                      //   controller: vlcViewController,
                      //   aspectRatio: 16 / 9,
                      //   placeholder: const Center(
                      //     child: CircularProgressIndicator(),
                      //   ),
                      // ),
                      Container(
                        width: size.width,
                        height: size.height / 2.8,
                        color: Colors.grey[300],
                        child: socketController.base64Image.isEmpty
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : Image.memory(
                                gaplessPlayback: true,
                                base64Decode(
                                    socketController.base64Image.value)),
                      ),

                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Stack(
                          children: [
                            Container(
                              width: 200.0,
                              height: 200.0,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                shape: BoxShape.circle,
                              ),
                            ),
                            Positioned(
                              top: 5.0,
                              left: 68.0,
                              child: IconButton(
                                onPressed: () => socketController.toUp(),
                                icon: const Icon(
                                  Icons.arrow_upward,
                                  size: 50,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 68.0,
                              left: 5.0,
                              child: IconButton(
                                onPressed: () => socketController.toLeft(),
                                icon: const Icon(
                                  Icons.arrow_back,
                                  size: 50,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 68.0,
                              right: 5.0,
                              child: IconButton(
                                onPressed: () => socketController.toRight(),
                                icon: const Icon(
                                  Icons.arrow_forward,
                                  size: 50,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 70.0,
                              child: IconButton(
                                onPressed: () => socketController.toDownward(),
                                icon: const Icon(
                                  Icons.arrow_downward,
                                  size: 50,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 77,
                              left: 77.0,
                              child: GestureDetector(
                                onTap: () => socketController.stop(),
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.black),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 20, top: 20),
                        child: Text(
                          "Cảm biến thiết bị:",
                          style: MyThemes.textTheme.titleLarge,
                        ),
                      ),
                      BuildSensors(
                        datas: socketController.dataSensors,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 20, top: 20),
                        child: Text(
                          "Thông số cảm biến:",
                          style: MyThemes.textTheme.titleLarge,
                        ),
                      ),
                      BuildTerminal(
                        datas: socketController.terminalDatas,
                        scrollController: socketController.scrollController,
                      )
                    ],
                  ),
                ),
              ),
              // bottomSheet: const PriceAndBookNow(),
            );
          }),
    );
  }

  Widget buildVehicleInfor() {
    return Container(
      color: AppColors.appBarColor,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        children: [
          // TextFieldWithTitle(
          //   textEditingController: nameDeviceController,
          //   title: 'Tên thiết bị',
          // ),
          TextFieldWithTitle(
            textEditingController: ipAddressController,
            title: 'Địa chỉ IP',
            isSubmit: homeController.isSubmit,
          ),
          // TextFieldWithTitle(
          //   textEditingController: portController,
          //   title: 'Cổng',
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {
                  if (ipAddressController.text.isNotEmpty) {
                    objectbox.editDevice(id, nameDeviceController.text,
                        ipAddressController.text, portController.text);
                  }
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0),
                      side: const BorderSide(
                        color: AppColors.colorDark,
                      ),
                    ),
                  ),
                ),
                child: Text(
                  'Chỉnh sửa',
                  style: MyThemes.textTheme.titleMedium,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

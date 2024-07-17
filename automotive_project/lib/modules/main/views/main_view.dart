import 'dart:async';

import 'package:automotive_project/core/base/base_view.dart';
import 'package:automotive_project/core/values/app_colors.dart';
import 'package:automotive_project/core/values/app_theme.dart';
import 'package:automotive_project/core/widget/show_toast_message.dart';
import 'package:automotive_project/core/widget/text_field_with_title.dart';
import 'package:automotive_project/data/model/devices/device.dart';
import 'package:automotive_project/main.dart';
import 'package:automotive_project/modules/home/widgets/car_card.dart';
import 'package:automotive_project/modules/main/controllers/main_controller.dart';
import 'package:automotive_project/modules/settings/views/settings_view.dart';
import 'package:automotive_project/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/controllers/socket_controller.dart';

// ignore: must_be_immutable
class MainView extends BaseView<MainController> {
  MainView({super.key});

  @override
  final controller = Get.find<MainController>();
  final socketController = Get.put(SocketController());

  @override
  PreferredSizeWidget? appBar(BuildContext context) => null;

  final MaterialStateProperty<Icon?> thumbIcon =
      MaterialStateProperty.resolveWith<Icon?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return const Icon(Icons.wifi_tethering_sharp);
      }
      return const Icon(Icons.close);
    },
  );

  @override
  Widget body(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return DefaultTabController(
      animationDuration: const Duration(milliseconds: 700),
      length: 2,
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.lightGreyColor.withOpacity(.1),
          centerTitle: true,
          title: Text(
            'Trang chủ',
            style: MyThemes.textTheme.titleLarge,
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(AppBar().preferredSize.height),
            child: Container(
              height: 50,
              color: AppColors.lightGreyColor.withOpacity(.1),
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 5,
              ),
              child: const TabBar(
                labelColor: Colors.black,
                unselectedLabelColor: Colors.black,
                tabs: [
                  Tab(
                    text: 'Hồ Sơ',
                  ),
                  Tab(
                    text: 'Danh Sách Thiết Bị',
                  )
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            SettingsView(),
            _buildVehicleTab(size),
          ],
        ),
      ),
    );

    // SafeArea(
    //   child:
    // );
  }

  Stack _buildVehicleTab(Size size) {
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          child: Container(
            width: size.width,
            height: size.height / 2,
            padding: const EdgeInsets.all(14.0),
            decoration: const BoxDecoration(color: Colors.black),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.compass_calibration,
                      color: AppColors.appBarColor,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    RichText(
                      text: TextSpan(
                        text: "Tìm kiếm\n",
                        style: MyThemes.textTheme.bodySmall!.copyWith(
                          color: AppColors.appBarColor,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Bật',
                            style: MyThemes.textTheme.bodySmall!.copyWith(
                              color: AppColors.colorPrimary,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.compass_calibration,
                      color: AppColors.appBarColor,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    RichText(
                      text: TextSpan(
                        text: "Trạng thái mạng\n",
                        style: MyThemes.textTheme.bodySmall!.copyWith(
                          color: AppColors.appBarColor,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Trực tuyến',
                            style: MyThemes.textTheme.bodySmall!.copyWith(
                              color: AppColors.colorPrimary,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: size.height / 9,
          child: Container(
            width: size.width,
            height: size.height / 1.48,
            decoration: BoxDecoration(
              color: AppColors.appBarColor,
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  24.0,
                ),
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.textColorGreyDark.withOpacity(.5),
                  spreadRadius: 10,
                  blurRadius: 20,
                  offset: const Offset(0, 1),
                )
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Get.defaultDialog(
                            title: "Thêm mới thiết bị",
                            titleStyle: const TextStyle(fontSize: 20),
                            content: Container(
                                width: 500,
                                height: 150,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15.0, horizontal: 15.0),
                                child: Column(
                                  children: [
                                    TextFieldWithTitle(
                                      textEditingController: controller
                                          .homeController.ipAddressController,
                                      title: 'Địa chỉ IP',
                                    ),
                                  ],
                                )),
                            confirm: ElevatedButton(
                              onPressed: () {
                                // if (nameDeviceController.text.isNotEmpty &&
                                //     ipAddressController.text.isNotEmpty &&
                                //     portController.text.isNotEmpty) {
                                //   objectbox.editDevice(id, nameDeviceController.text,
                                //       ipAddressController.text, portController.text);
                                // }
                                if (controller.homeController
                                    .ipAddressController.text.isNotEmpty) {
                                  objectbox.addDevice(
                                      '',
                                      controller.homeController
                                          .ipAddressController.text,
                                      '5000');
                                  Get.back();
                                }
                              },
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6.0),
                                    side: const BorderSide(
                                      color: AppColors.colorDark,
                                    ),
                                  ),
                                ),
                              ),
                              child: const Text("Thêm mới"),
                            ),
                            cancel: ElevatedButton(
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6.0),
                                      side: const BorderSide(
                                        color: AppColors.colorDark,
                                      ),
                                    ),
                                  ),
                                ),
                                onPressed: () => Get.back(),
                                child: const Text("Huỷ")),
                          );
                        },
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.0),
                              side: const BorderSide(
                                color: AppColors.colorDark,
                              ),
                            ),
                          ),
                        ),
                        child: Text(
                          'Thêm thiết bị',
                          style: MyThemes.textTheme.titleMedium,
                        ),
                      ),
                      Obx(
                        () => Row(
                          children: [
                            Text(
                              'Dò thiết bị',
                              style: MyThemes.textTheme.titleLarge,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Switch(
                              thumbIcon: thumbIcon,
                              value: controller.scanDetection.value,
                              onChanged: (bool value) {
                                if (controller.scanDetection.value == false) {
                                  controller.pingStatus.value = false;
                                }
                                controller.scanDetection.value = value;
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  buildListVehicles(size),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          child: Obx(
            () => controller.pingStatus.value && controller.scanDetection.value
                ? _buildRadar()
                : Container(),
          ),
        ),
        Positioned(
          bottom: size.height / 18,
          left: size.width / 3.5,
          child: _buildPingButton(),
        )
      ],
    );
  }

  Widget _buildRadar() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: CustomPaint(
        painter: RadarPainter(),
        child: RotationTransition(
          turns: Tween(begin: 0.0, end: 6.0)
              .animate(controller.animationController),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: SweepGradient(
                center: FractionalOffset.center,
                colors: <Color>[
                  Colors.transparent,
                  Colors.transparent,
                  AppColors.colorPrimary.withOpacity(0.5),
                  AppColors.colorPrimary.withOpacity(0.8),
                  Colors.transparent,
                ],
                stops: const <double>[
                  0.0,
                  0.3,
                  0.6,
                  0.8,
                  1.0,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPingButton() {
    return Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(100), topRight: Radius.circular(100)),
          boxShadow: [
            BoxShadow(
              color: Colors.black26.withOpacity(.1),
              blurRadius: 9.0,
              offset: const Offset(0, -3.0), // Move shadow to the top
              spreadRadius:
                  1.0, // Increase if you want to spread the shadow more
            ),
          ],
        ),
        child: Obx(
          () => ElevatedButton(
            onPressed: () async {
              controller.pingStatus.value = !controller.pingStatus.value;
              if (controller.scanDetection.value) {
                await socketController.scanVehicles();
                Timer(const Duration(seconds: 2), () {
                  print('listId: ${socketController.listIp}');
                  if (socketController.listIp.isNotEmpty) {
                    showToastSuccessMessage("Thông báo",
                        "Dò được ${socketController.listIp.length} thiết bị");
                    for (var v in socketController.listIp) {
                      final Device device = objectbox.getDeviceByIP(v);
                      if (device.ipAddress.isEmpty) {
                        objectbox.addDevice("", v, "");
                      }
                    }
                    controller.scanDetection.value = false;
                  } else {
                    showToastErrorMessage("Thông báo",
                        "Dò được ${socketController.listIp.length} thiết bị");
                    controller.scanDetection.value = false;
                    return;
                  }
                });
              }
            },
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              backgroundColor: !controller.scanDetection.value
                  ? AppColors.lightGreyColor
                  : AppColors.colorPrimary,
              padding: const EdgeInsets.all(25),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const RotatedBox(
                      quarterTurns: 3,
                      child: Icon(
                        Icons.wifi,
                        color: AppColors.colorWhite,
                      )),
                  Text(
                    'PING',
                    style: MyThemes.textTheme.titleMedium!
                        .copyWith(color: AppColors.colorWhite),
                  ),
                  const RotatedBox(
                      quarterTurns: 1,
                      child: Icon(
                        Icons.wifi,
                        color: AppColors.colorWhite,
                      )),
                ],
              ),
            ),
          ),
        ));
  }

  buildListVehicles(Size size) {
    return SingleChildScrollView(
        child: SizedBox(
            width: size.width,
            height: size.height / 2,
            // height: size.height,
            child: Obx(
              () {
                final devices = objectbox.getAllDevices();
                if (devices.isEmpty) {
                  return const Center(child: Text("Chưa có dữ liệu"));
                }
                return ListView.separated(
                  itemCount: objectbox.getAllDevices().length,
                  shrinkWrap: true,
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 10,
                    );
                  },
                  itemBuilder: (context, index) {
                    final data = devices[index];
                    return GestureDetector(
                      onTap: () => Get.toNamed(Routes.HOME_DETAILS,
                          arguments: {'id': data.id}),
                      child: Dismissible(
                        key: Key(data.id.toString()),
                        onDismissed: (direction) {
                          objectbox.removeDevice(data.id);
                          Get.snackbar(
                              "Thông báo", "${data.id} xoá thành công");
                        },
                        background: Container(
                          color: Colors.red,
                          child: const Icon(
                            Icons.delete,
                            size: 30,
                          ),
                        ),
                        child: CarCard(
                          deviceName: "Car ${(index + 1).toString()}",
                          ipAddress: data.ipAddress,
                          port: "5000",
                          date: data.date.toString(),
                        ),
                      ),
                    );
                  },
                );
              },
            )));
  }
}

class RadarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey.shade300
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    canvas.drawCircle(center, radius / 25, paint);

    for (int i = 1; i <= 5; i++) {
      canvas.drawCircle(center, radius * i / 5, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

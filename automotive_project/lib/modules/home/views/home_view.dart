// import 'package:automotive_project/core/base/base_view.dart';
// import 'package:automotive_project/core/controllers/netword_controller.dart';
// import 'package:automotive_project/core/values/app_theme.dart';
// import 'package:automotive_project/core/widget/custom_app_bar.dart';
// import 'package:automotive_project/core/widget/showDialog.dart';
// import 'package:automotive_project/data/model/devices/device.dart';
// import 'package:automotive_project/main.dart';
// import 'package:automotive_project/modules/home/controllers/home_controller.dart';
// import 'package:automotive_project/modules/home/widgets/car_card.dart';
// import 'package:automotive_project/routes/app_pages.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_vlc_player/flutter_vlc_player.dart';
// import 'package:get/get.dart';

// import '../../../core/widget/text_field_with_title.dart';

// class HomeView extends BaseView<HomeController> {
//   HomeView({super.key});
//   final homeController = Get.find<HomeController>();
//   final networkController = Get.find<NetworkController>();
//   @override
//   PreferredSizeWidget? appBar(BuildContext context) {
//     return null;
//   }

//   @override
//   Widget pageContent(BuildContext context) {
//     return DevicesManager(
//       controller: homeController,
//     );
//   }

//   @override
//   Widget body(BuildContext context) {
//     return build(context);
//   }
// }

// class DevicesManager extends StatelessWidget {
//   const DevicesManager({super.key, required this.controller});
//   final HomeController controller;
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return DefaultTabController(
//       length: 2,
//       child: SafeArea(
//         child: Scaffold(
//           appBar: CustomAppBar(
//             isBackButtonEnabled: false,
//             appBarTitleText: 'Trang chủ',
//             homeController: controller,
//           ),
//           body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//             Container(
//               margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
//               child: Text(
//                 'Danh sách phương tiện: ',
//                 style: MyThemes.textTheme.titleLarge,
//               ),
//             ),
//             buildActiveTab(),
//           ]),
//           floatingActionButton: FloatingActionButton(
//             onPressed: () async {
//               await showMyDialog(
//                   title: "Thêm mới thiết bị",
//                   actions: [
//                     ElevatedButton(
//                         onPressed: () => Get.back(), child: const Text('Huỷ')),
//                     ElevatedButton(
//                         onPressed: () {
//                           objectbox.addDevice(
//                               controller.nameDeviceController.text,
//                               controller.ipAddressController.text,
//                               controller.portController.text);
//                           Get.back();
//                         },
//                         child: const Text('Thêm mới')),
//                   ],
//                   content: buildContent(null),
//                   context: context);
//             },
//             child: const Icon(Icons.add),
//           ),
//         ),
//       ),
//     );
//   }

//   buildActiveTab() {
//     return StreamBuilder<List<Device>>(
//       stream: objectbox.getDevices(),
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           return ListView.separated(
//             itemCount: snapshot.hasData ? snapshot.data!.length : 0,
//             shrinkWrap: true,
//             separatorBuilder: (context, index) {
//               return const SizedBox(
//                 height: 10,
//               );
//             },
//             itemBuilder: (context, index) {
//               final data = snapshot.data![index];
//               return Material(
//                 child: InkResponse(
//                   onTap: () => Get.toNamed(Routes.HOME_DETAILS,
//                       arguments: {'id': data.id}),
//                   child: Dismissible(
//                     key: Key(data.id.toString()),
//                     onDismissed: (direction) {
//                       objectbox.removeDevice(data.id);
//                       Get.snackbar("Thông báo", "${data.id} xoá thành công");
//                     },
//                     background: Container(
//                       color: Colors.red,
//                       child: const Icon(
//                         Icons.delete,
//                         size: 30,
//                       ),
//                     ),
//                     child: CarCard(
//                       deviceName: data.deviceName ?? "",
//                       ipAddress: data.ipAddress,
//                       port: data.port ?? "",
//                       date: data.date.toString(),
//                     ),
//                   ),
//                 ),
//               );
//             },
//           );
//         }
//         return const Center(child: CircularProgressIndicator());
//       },
//     );
//   }

//   Widget buildContent(int? id) {
//     Device value;
//     if (id != null) {
//       value = objectbox.getDeviceById(id);
//       if (value.deviceName != null) {
//         controller.nameDeviceController.text = value.deviceName!;
//       }
//       controller.ipAddressController.text = value.ipAddress;
//     } else {
//       controller.nameDeviceController.text = '';
//       controller.ipAddressController.text = '';
//       controller.portController.text = '';
//     }
//     return Column(
//       children: [
//         TextFieldWithTitle(
//           textEditingController: controller.nameDeviceController,
//           title: 'Tên thiết bị',
//         ),
//         TextFieldWithTitle(
//           textEditingController: controller.ipAddressController,
//           title: 'Địa chỉ IP',
//         ),
//         TextFieldWithTitle(
//           textEditingController: controller.portController,
//           title: 'Port',
//         ),
//       ],
//     );
//   }

//   Widget buildStreamVideo(HomeController homeController) {
//     homeController.vlcViewController = VlcPlayerController.network(
//         "rtsp://localhost:8554/live",
//         hwAcc: HwAcc.full,
//         autoPlay: true,
//         options: VlcPlayerOptions());
//     return Container(
//       alignment: Alignment.center,
//       width: double.infinity,
//       height: 300,
//       child: VlcPlayer(
//         controller: homeController.vlcViewController,
//         aspectRatio: 4 / 3,
//         placeholder: const Center(
//           child: CircularProgressIndicator(),
//         ),
//       ),
//     );
//   }
// }

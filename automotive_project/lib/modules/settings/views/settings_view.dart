import 'package:automotive_project/core/base/base_view.dart';
import 'package:automotive_project/core/values/app_colors.dart';
import 'package:automotive_project/modules/settings/controllers/settings_controller.dart';
import 'package:automotive_project/modules/settings/widget/profile_menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsView extends BaseView<SettingsController> {
  const SettingsView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        // Stack(
        //   children: [
        //     // SizedBox(
        //     //   width: 120,
        //     //   height: 120,
        //     //   child: ClipRRect(
        //     //       borderRadius: BorderRadius.circular(100), child: const Image(image: AssetImage(tProfileImage))),
        //     // ),
        //     Positioned(
        //       bottom: 0,
        //       right: 0,
        //       child: Container(
        //         width: 35,
        //         height: 35,
        //         decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(100),
        //             color: AppColors.colorPrimary),
        //         child: const Icon(
        //           Icons.abc,
        //           color: Colors.black,
        //           size: 20,
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
        const SizedBox(height: 10),
        Text('Heading', style: Theme.of(context).textTheme.headlineMedium),
        Text('Subheading', style: Theme.of(context).textTheme.bodyMedium),
        const SizedBox(height: 20),

        /// -- BUTTON
        SizedBox(
          width: 200,
          child: ElevatedButton(
            onPressed: null,
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.colorPrimary,
                side: BorderSide.none,
                shape: const StadiumBorder()),
            child: const Text('Edit', style: TextStyle(color: Colors.black)),
          ),
        ),
        const SizedBox(height: 30),
        const Divider(),
        const SizedBox(height: 10),

        /// -- MENU
        ProfileMenuWidget(
            title: "Settings", icon: Icons.wallet, onPress: () {}),
        ProfileMenuWidget(
            title: "Billing Details", icon: Icons.wallet, onPress: () {}),
        ProfileMenuWidget(
            title: "User Management", icon: Icons.wallet, onPress: () {}),
        const Divider(),
        const SizedBox(height: 10),
        ProfileMenuWidget(
            title: "Information", icon: Icons.wallet, onPress: () {}),
        ProfileMenuWidget(
            title: "Đăng xuất",
            icon: Icons.logout,
            textColor: Colors.red,
            endIcon: false,
            onPress: () {
              Get.defaultDialog(
                title: "Đăng xuất",
                titleStyle: const TextStyle(fontSize: 20),
                content: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                  child: Text("Bạn có muốn đăng xuất không?"),
                ),
                confirm: Expanded(
                  child: ElevatedButton(
                    onPressed: null,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        side: BorderSide.none),
                    child: const Text("Có"),
                  ),
                ),
                cancel: OutlinedButton(
                    onPressed: () => Get.back(), child: const Text("Không")),
              );
            }),
      ],
    );
  }
}

import 'dart:convert';

import 'package:automotive_project/core/base/base_view.dart';
import 'package:automotive_project/core/values/app_colors.dart';
import 'package:automotive_project/data/local/preference/preference_manager.dart';
import 'package:automotive_project/modules/auth/login/views/login_view.dart';
import 'package:automotive_project/modules/settings/controllers/settings_controller.dart';
import 'package:automotive_project/modules/settings/widget/profile_menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsView extends BaseView<SettingsController> {
  SettingsView({super.key});
  final sharePref =
      Get.find<PreferenceManager>(tag: (PreferenceManager).toString());
  final settingController = Get.find<SettingsController>();
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return FutureBuilder(
        future: sharePref.getString(PreferenceManager.userStore),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = jsonDecode(snapshot.data!);
            return Column(
              children: [
                const SizedBox(height: 10),
                Text('Hi ${data['fullname']}!',
                    style: Theme.of(context).textTheme.headlineMedium),

                /// -- BUTTON        const SizedBox(height: 30),
                const SizedBox(height: 10),
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: null,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.colorPrimary,
                        side: BorderSide.none,
                        shape: const StadiumBorder()),
                    child: const Text('Chỉnh sửa',
                        style: TextStyle(color: Colors.black)),
                  ),
                ),
                const Divider(),
                const SizedBox(height: 10),

                /// -- MENU
                ProfileMenuWidget(
                  title: data['fullname'],
                  icon: Icons.person_2_outlined,
                  onPress: () {},
                  endIcon: false,
                ),
                ProfileMenuWidget(
                    title: 'Email: ${data['email']}',
                    icon: Icons.email,
                    onPress: () {},
                    endIcon: false),
                ProfileMenuWidget(
                    title: 'Tên đăng nhập: ${data['username']}',
                    icon: Icons.person,
                    onPress: () {},
                    endIcon: false),
                ProfileMenuWidget(
                    title: 'Số điện thoại: ${data['phone']}',
                    icon: Icons.phone,
                    onPress: () {},
                    endIcon: false),
                const Divider(),
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
                            onPressed: () {
                              sharePref.clear();
                              Get.offAll(LoginView());
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.redAccent,
                                side: BorderSide.none),
                            child: const Text("Có"),
                          ),
                        ),
                        cancel: OutlinedButton(
                            onPressed: () => Get.back(),
                            child: const Text("Không")),
                      );
                    }),
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}

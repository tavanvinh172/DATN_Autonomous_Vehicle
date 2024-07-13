import 'package:automotive_project/core/values/app_colors.dart';
import 'package:automotive_project/core/widget/app_bar_title.dart';
import 'package:automotive_project/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String appBarTitleText;
  final List<Widget>? actions;
  final bool isBackButtonEnabled;
  final HomeController homeController;

  const CustomAppBar({
    super.key,
    required this.appBarTitleText,
    this.actions,
    this.isBackButtonEnabled = true,
    required this.homeController,
  });

  @override
  Size get preferredSize =>
      const Size.fromHeight(150); // Adjust height to accommodate TabBar

  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;
    return Container(
      height: widthScreen * 0.2, // here the desired height
      decoration: const BoxDecoration(
        color: AppColors.appBarColor,
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          AppBar(
            backgroundColor: AppColors.appBarColor,
            title: AppBarTitle(
              text: appBarTitleText,
            ),
            actions: actions,
            leading: isBackButtonEnabled ? const BackButton() : null,
          ),
        ],
      ),
    );
  }
}

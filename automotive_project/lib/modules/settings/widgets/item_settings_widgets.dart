import 'package:automotive_project/core/base/base_widget_mixin.dart';
import 'package:flutter/material.dart';

class ItemSettings extends StatelessWidget with BaseWidgetMixin {
  final String prefixImage;
  final String suffixImage;
  final String title;
  final Function()? onTap;

  ItemSettings({
    super.key,
    required this.prefixImage,
    required this.suffixImage,
    required this.title,
    required this.onTap,
  });

  @override
  Widget body(BuildContext context) {
    return Container();
    // Ripple(
    //   onTap: onTap,
    //   child: Padding(
    //     padding: const EdgeInsets.all(AppValues.padding),
    //     child: Row(
    //       children: [
    //         AssetImageView(
    //           fileName: prefixImage,
    //           height: AppValues.iconSize_20,
    //           width: AppValues.iconSize_20,
    //         ),
    //         const SizedBox(width: AppValues.smallPadding),
    //         Text(title, style: settingsItemStyle),
    //         const Spacer(),
    //         AssetImageView(
    //           fileName: suffixImage,
    //           color: AppColors.suffixImageColor,
    //           height: AppValues.iconSize_20,
    //           width: AppValues.iconSize_20,
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}

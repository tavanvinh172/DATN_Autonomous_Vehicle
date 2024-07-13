import 'package:automotive_project/core/base/base_view.dart';
import 'package:automotive_project/core/values/text_styles.dart';
import 'package:automotive_project/modules/favorite/controllers/favorite_controller.dart';
import 'package:flutter/material.dart';

class FavoriteView extends BaseView<FavoriteController> {
  const FavoriteView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return const Center(
      child: Text(
        'FavoriteView is working',
        style: titleStyle,
      ),
    );
  }
}

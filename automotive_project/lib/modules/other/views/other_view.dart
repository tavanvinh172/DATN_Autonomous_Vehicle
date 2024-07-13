import 'package:automotive_project/core/base/base_view.dart';
import 'package:flutter/material.dart';

import '../controllers/other_controller.dart';

class OtherView extends BaseView<OtherController> {
  final String viewParam;

  const OtherView({super.key, this.viewParam = ""});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return const Center(
      child: Text(
        'OtherView is working',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}

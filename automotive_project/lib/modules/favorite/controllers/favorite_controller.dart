import 'package:automotive_project/core/base/base_controller.dart';
import 'package:get/get.dart';

class FavoriteController extends BaseController {
  final count = 0.obs;

  void increment() => count.value++;
}

import 'package:automotive_project/core/controllers/netword_controller.dart';
import 'package:automotive_project/core/controllers/rive_animation.dart';
import 'package:get/get.dart';

class NetworkConnectionBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<NetworkController>(NetworkController(), permanent: true);
    Get.put<InitialRiveAnimation>(InitialRiveAnimation(), permanent: true);
  }
}

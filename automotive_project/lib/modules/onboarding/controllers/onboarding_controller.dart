import 'package:automotive_project/core/base/base_controller.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';

class OnboardingController extends BaseController {
  late RiveAnimationController animationController;
  final isSignInDialogShown = false.obs;
  @override
  void onInit() {
    animationController = OneShotAnimation("active", autoplay: false);
    super.onInit();
  }
}
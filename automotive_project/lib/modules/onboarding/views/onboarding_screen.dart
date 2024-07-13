import 'dart:ui';

import 'package:automotive_project/core/base/base_view.dart';
import 'package:automotive_project/modules/onboarding/controllers/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';

import '../widgets/animated_button.dart';
import 'sign_in_form.dart';

class OnboardingScreen extends BaseView<OnboardingController> {
  OnboardingScreen({super.key});
  @override
  final controller = Get.find<OnboardingController>();
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              width: MediaQuery.of(context).size.width * 1.7,
              bottom: 200,
              left: 100,
              child: Image.asset("assets/Backgrounds/Spline.png")),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10),
            ),
          ),
          const RiveAnimation.asset(
            'assets/RiveAssets/shapes.riv',
            fit: BoxFit.cover,
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
              child: const SizedBox(),
            ),
          ),
          Obx(
            () => AnimatedPositioned(
              top: controller.isSignInDialogShown.value ? -50 : 0,
              duration: const Duration(milliseconds: 240),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Spacer(),
                      const SizedBox(
                        width: 260,
                        child: Column(
                          children: [
                            Text(
                              'Learn design & code',
                              style: TextStyle(
                                  fontSize: 60,
                                  fontFamily: 'Poppins',
                                  height: 1.2,
                                  color: Colors.black),
                            ),
                            SizedBox(height: 16),
                            Text(
                              "Don’t skip design. Learn design and code, by building real apps with Flutter and Swift. Complete courses about the best tools.",
                            ),
                          ],
                        ),
                      ),
                      const Spacer(
                        flex: 2,
                      ),
                      AnimatedButton(
                        controller: controller,
                        action: () {
                          controller.animationController.isActive = true;
                          Future.delayed(const Duration(milliseconds: 800), () {
                            controller.isSignInDialogShown(true);
                            customSignInDialog(context);
                          });
                        },
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 24),
                        child: Text(
                            "Purchase includes access to 30+ courses, 240+ premium tutorials, 120+ hours of videos, source files and certificates."),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<Object?> customSignInDialog(BuildContext context) {
    return showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: "Sign in",
      transitionDuration: const Duration(milliseconds: 400),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        Tween<Offset> tween;
        tween = Tween(begin: const Offset(0, -1), end: Offset.zero);
        return SlideTransition(
          position: tween.animate(
            CurvedAnimation(parent: animation, curve: Curves.easeInOut),
          ),
          child: child,
        );
      },
      pageBuilder: (context, _, __) => Center(
        child: Container(
          height: 620,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.94),
            borderRadius: const BorderRadius.all(
              Radius.circular(40),
            ),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 32,
            horizontal: 24,
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(
              clipBehavior: Clip.none,
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      const Text(
                        "Sign In",
                        style: TextStyle(fontSize: 34, fontFamily: "Poppins"),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: Text(
                          "Access to 240+ hours of content. Learn design and code, by building real apps with Flutter and Swift.",
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SignInForm(),
                      const Row(
                        children: [
                          Expanded(
                            child: Divider(),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              "OR",
                              style: TextStyle(
                                color: Colors.black26,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Expanded(child: Divider()),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 24),
                        child: Text(
                          "Sign up with Email, Apple or Google",
                          style: TextStyle(color: Colors.black54),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            onPressed: () {},
                            padding: EdgeInsets.zero,
                            icon: SvgPicture.asset(
                              "assets/icons/email_box.svg",
                              height: 32,
                              width: 32,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            padding: EdgeInsets.zero,
                            icon: SvgPicture.asset(
                              "assets/icons/apple_box.svg",
                              height: 32,
                              width: 32,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            padding: EdgeInsets.zero,
                            icon: SvgPicture.asset(
                              "assets/icons/google_box.svg",
                              height: 32,
                              width: 32,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Positioned(
                    left: 0,
                    right: 0,
                    bottom: -48,
                    child: CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.close,
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    ).then((_) => controller.isSignInDialogShown(false));
  }
}

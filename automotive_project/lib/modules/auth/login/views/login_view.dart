import 'dart:ui';

import 'package:automotive_project/core/base/base_view.dart';
import 'package:automotive_project/core/controllers/rive_animation.dart';
import 'package:automotive_project/modules/auth/login/controllers/login_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';

class LoginView extends BaseView<LoginController> {
  LoginView({super.key});
  final loginController = Get.put(LoginController());
  final riveController = Get.find<InitialRiveAnimation>();
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        const RiveAnimation.asset(
          "assets/RiveAssets/vehicles.riv",
          fit: BoxFit.cover,
        ),
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: const SizedBox(),
          ),
        ),
        SlideTransition(
          position: loginController.offsetAnimation,
          child: Align(
            alignment: Alignment.center,
            child: Container(
              height: screenHeight * .4 + 100,
              width: screenWidth,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.6),
                borderRadius: const BorderRadius.all(
                  Radius.circular(25),
                ),
              ),
              padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Text(
                      "Đăng nhập",
                      style: TextStyle(fontSize: 34, fontFamily: "Poppins"),
                    ),
                    Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Tên Đăng Nhập:",
                            style: TextStyle(color: Colors.black54),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0, bottom: 16),
                            child: TextFormField(
                              controller: loginController.usernameController.value,
                              decoration: InputDecoration(
                                focusedBorder: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16.0))),
                                border: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16.0))),
                                prefixIcon: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8.0),
                                  child:
                                      SvgPicture.asset("assets/icons/email.svg"),
                                ),
                              ),
                            ),
                          ),
                          const Text(
                            "Mật Khẩu:",
                            style: TextStyle(color: Colors.black54),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0, bottom: 16),
                            child: TextFormField(
                              controller: loginController.passwordController.value,
                              obscureText: true,
                              decoration: InputDecoration(
                                focusedBorder: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16.0))),
                                border: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16.0))),
                                prefixIcon: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: SvgPicture.asset(
                                      "assets/icons/password.svg"),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0, bottom: 24),
                            child: ElevatedButton.icon(
                              onPressed: () => loginController.login(),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFF77D8E),
                                  minimumSize: const Size(double.infinity, 56),
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(25),
                                          bottomRight: Radius.circular(25),
                                          bottomLeft: Radius.circular(25)))),
                              icon: const Icon(
                                CupertinoIcons.arrow_right,
                                color: Color(0xFFFE0037),
                              ),
                              label: const Text("Đăng nhập"),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
    // SingleChildScrollView(
    //   child: Center(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         const SizedBox(height: 50),

    //         // logo
    //         const Icon(
    //           Icons.lock,
    //           size: 100,
    //         ),

    //         const SizedBox(height: 50),

    //         const SizedBox(height: 25),

    //         // username textfield
    //         CustomTextField(
    //           controller: loginController.usernameController.value,
    //           hintText: 'Tên Đăng Nhập',
    //           obscureText: false,
    //         ),

    //         const SizedBox(height: 10),

    //         // password textfield
    //         CustomTextField(
    //           controller: loginController.passwordController.value,
    //           hintText: 'Mật Khẩu',
    //           obscureText: true,
    //         ),

    //         const SizedBox(height: 10),

    //         // forgot password?
    //         Padding(
    //           padding: const EdgeInsets.symmetric(horizontal: 25.0),
    //           child: Row(
    //             mainAxisAlignment: MainAxisAlignment.end,
    //             children: [
    //               Text(
    //                 'Quên mật khẩu?',
    //                 style: TextStyle(color: Colors.grey[600]),
    //               ),
    //             ],
    //           ),
    //         ),

    //         const SizedBox(height: 25),

    //         // sign in button
    //         CustomButton(
    //           onTap: () => loginController.login(),
    //         ),

    //         const SizedBox(height: 50),

    //         Padding(
    //           padding: const EdgeInsets.symmetric(horizontal: 25.0),
    //           child: Row(
    //             children: [
    //               Expanded(
    //                 child: Divider(
    //                   thickness: 0.5,
    //                   color: Colors.grey[400],
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),

    //         const SizedBox(height: 50),

    //         // google + apple sign in buttons
    //         const Row(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: [
    //             // google button
    //             // SquareTile(imagePath: 'lib/images/google.png'),

    //             SizedBox(width: 25),

    //             // apple button
    //             // SquareTile(imagePath: 'lib/images/apple.png')
    //           ],
    //         ),

    //         const SizedBox(height: 50),

    //         // not a member? register now
    //         // Row(
    //         //   mainAxisAlignment: MainAxisAlignment.center,
    //         //   children: [
    //         //     Text(
    //         //       'Not a member?',
    //         //       style: TextStyle(color: Colors.grey[700]),
    //         //     ),
    //         //     const SizedBox(width: 4),
    //         //     const Text(
    //         //       'Register now',
    //         //       style: TextStyle(
    //         //         color: Colors.blue,
    //         //         fontWeight: FontWeight.bold,
    //         //       ),
    //         //     ),
    //         //   ],
    //         // )
    //       ],
    //     ),
    //   ),
    // );
  }
}
